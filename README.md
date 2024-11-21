[UNDER CONSTRUCTION]

Information on running microfinder to aid bird genome curation here: https://zenodo.org/records/13913870. 

# Installation
```
git clone https://github.com/sanger-tol/MicroFinder.git

# Install dependencies with
bundler install
```

# Usage:
```
MicroFinder.sh input_fasta max_scaffold_cutoff

```

or with singularity:
```
singularity run -B `pwd`:/data docker://ghcr.io/sanger-tol/microfinder:main /data/bLarArg3.1.HAP1.primary.curated.fa 1000000
```

or docker:
```
docker run -v `pwd`:/data ghcr.io/sanger-tol/microfinder:main /data/bLarArg3.1.HAP1.primary.curated.fa 1000000

```
