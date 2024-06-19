```
Install dependencies with
    bundler install
```

```
Usage: sort_fasta.rb [options]
    -f, --fasta FASTA               FASTA file
    -o, --order TSV                 TSV file with sort order
    -l, --length_cutoff LEN         sequences > LEN bp will not be sorted
    -m, --minimum_length MIN        sequences < MIN bp will not be sorted
    -h, --help                      prints this help
    -v, --version                   print version
```
* the order file is tab separated with an id and an integer (the higher, the further to the beginning it will be sorted)
* the -l / -m options will set the score to 0 for sequences longer/shorter
* equal scoring ids will be sorted by sequence length (with the smaller ones towards the end).
