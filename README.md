# ngs2counts_nextflow
This pipeline takes a runfolder and runs ngs2counts on it creating count files which are saved in the incoming folder on Miarka.

## Usage

```
nextflow run main.nf --input_folder <path_to_runfolder> --ngs2counts_executable <path_to_ngs2counts_version>
```


### Running on Uppmax

When running on Uppmax, use `-profile uppmax`

## Input
- `--input_folder <path_to_runfolder>`: path to the runfolder for which ngs2counts needs to be run
- `--ngs2counts_executable <path_to_ngs2counts_version>`: path to ngs2counts version to use
- `--ngs2counts_extra_args <string_with_extra_args>`: optional parameter for extra ngs2counts arguments

## Output

The pipeline will write the results in the input_folder. Creating the following structure:

```
input_folder
├── ngs2counts
│   ├── counts_*.csv
│   └── run_metadata.json
├── ngs2counts_log.txt
└── ngs2counts_version.txt
```

## Running the tests
```
nf-test test
```
