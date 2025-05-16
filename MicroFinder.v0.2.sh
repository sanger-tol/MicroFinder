#!/bin/bash

# v0.2 script - in future will update locations of gene set, tools etc. so will work with a release.

# Changes from v0.1: Updated to MicroFinder naming.

if [ $# -ne 2 ]; then
    echo $0: usage: bash MircoFinder.sh input_assembly scaffold_length_cutoff
    exit 1
fi 

# vars
 
input_assembly=$1
length_cutoff=$2
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# map gene set
miniprot --gff ${input_assembly} $SCRIPT_DIR/data/MicroFinder_prot_set.v0.1.fa.gz > ${input_assembly}.MicroFinder.gff

# Filter hits

awk '$3== "mRNA"' ${input_assembly}.MicroFinder.gff | grep -w "Rank=1" | cut -f1,9 | tr ";" "\t" | cut -f1,4,5,6,7 | sed 's/Identity=//g' | sed 's/Positive=//g' | awk '$2 >= 0.7' |  cut -f1 | sort | uniq -c | sort -k1,1nr | awk '{print $2 "\t" $1}' > ${input_assembly}.MicroFinder.order.tsv

# Reorder assembly

$SCRIPT_DIR/sort_fasta.rb -f ${input_assembly} -o ${input_assembly}.MicroFinder.order.tsv -l ${length_cutoff} > ${input_assembly}.MicroFinder.ordered.fa
