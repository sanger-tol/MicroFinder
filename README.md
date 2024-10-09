[UNDER CONSTRUCTION]

# Installation
```
git clone https://github.com/Aquatic-Symbiosis-Genomics-Project/MicroFinder.git

# Install dependencies with
bundler install
```

# Usage:
```
MicroFinder.sh input_fasta max_scaffold_cutoff

```

or with singularity:
```
singularity run -B `pwd`:/data docker://ghcr.io/aquatic-symbiosis-genomics-project/microfinder:latest /data/bLarArg3.1.HAP1.primary.curated.fa 1000000
```

or docker:
```
docker run -v `pwd`:/data ghcr.io/aquatic-symbiosis-genomics-project/microfinder:latest /data/bLarArg3.1.HAP1.primary.curated.fa 1000000

```
