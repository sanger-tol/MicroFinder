#!/usr/bin/env ruby
# usage: ruby sort_fasta.rb -o <id-tab-int> -f <FASTA> [ -l <length> ]

#require 'bundler/setup'
require 'gdbm'
require 'yaml'
require 'bio'
require 'optparse'

options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: sort_fasta.rb [options]"

  opts.on("-f FASTA", "--fasta FASTA", String, "FASTA file")
  opts.on("-o TSV", "--order TSV", String, "TSV file with sort order")
  opts.on("-l","--length_cutoff LEN",Integer, "Sequences > LEN bp will not be sorted")
  opts.on("-h", "--help", "Prints this help") do
    puts opts
    exit
  end
end.parse!(into: options)

dbfile = 'seqstore.db'
gdb = GDBM.new(dbfile,nil,GDBM::NEWDB)

id_to_count = Hash.new
File.open(options[:order]).each{|line|
  (id,count) = line.chomp.split
  id_to_count[id]=count.to_i
}

id_to_size = Hash.new
Bio::FlatFile.open(Bio::FastaFormat,options[:fasta]) do |ff|
  ff.each do |entry|
    id_to_count[entry.entry_id]||=0
    id_to_count[entry.entry_id]=0 if options[:length_cutoff] && entry.length > options[:length_cutoff]
    id_to_size[entry.entry_id]=entry.seq.size
    gdb[entry.entry_id]=entry.to_yaml
  end
end

gdb.keys.sort_by{|e|
  [id_to_count[e],id_to_size[e]]
}.reverse.each{|id|
  e=YAML.load(gdb[id])#,permitted_classes: [Bio::FastaFormat,Bio::FastaDefline,Bio::Sequence::Generic])
  puts e.seq.to_fasta(e.definition)
}

gdb.close
File.delete(dbfile)
