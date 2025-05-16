
# MicroFinder

MicroFinder is a pipeline to aid the curation of bird genome assemblies by identifying putative microchromosome scaffolds and moving them to start of the genome assembly FASTA file. A Hi-C contact map can then be made using the MicroFinder-ordered assembly file for downstream manual curation.

The pipeline uses [miniprot](https://github.com/lh3/miniprot) to map a set of conserved microchromosome-associated proteins to a draft assembly and then counts the resulting hits and orders the input assembly by the number hits. Optionally, a maximum scaffold length cutoff can be set - this causes scaffolds shorter than the cutoff to be sorted by MicroFinder protein hits and scaffolds longer than the cutoff to be sorted by length. 

Details of the MircoFinder pipeline are provided in our preprint: https://doi.org/10.1101/2025.05.09.653066. 

A tutorial on using MicroFinder to aid bird genome curation with example datasets can be found here: https://zenodo.org/records/13913870. 

## Installation
```
git clone https://github.com/sanger-tol/MicroFinder.git

# Install dependencies with
bundler install
```

## Usage
```
MicroFinder.sh input_fasta output_prefix max_scaffold_length_cutoff

```

or with singularity:
```
singularity run -B `pwd`:/data docker://ghcr.io/sanger-tol/microfinder:main /data/bLarArg3.1.HAP1.primary.curated.fa bLarArg3 5000000
```

or docker:
```
docker run -v `pwd`:/data ghcr.io/sanger-tol/microfinder:main /data/bLarArg3.1.HAP1.primary.curated.fa bLarArg3 5000000

```

## Output files

miniprot alignments: `<output_prefix>.MicroFinder.gff`

Counts file of MicroFinder hits per scaffold: `<output_prefix>.MicroFinder.order.tsv`

MicroFinder-ordered assembly FASTA file: `<output_prefix>.MicroFinder.ordered.fa`

## Hi-C map construction for downstream manual curation

We recommend using [CurationPretext](https://pipelines.tol.sanger.ac.uk/curationpretext) to create a Hi-C contact map for manual curation of the MicroFinder-ordered assembly in [PretextView](https://github.com/sanger-tol/PretextView).

It is important to use `--map_order unsorted` when generating the Hi-C contact map to retain the MicroFinder sort order. 




