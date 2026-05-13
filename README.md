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

## Output 

The pipeline will write the results in the inputfolder. Creating a ngs2counts_version.txt file and a folder named ngs2counts which will contain the count files. 

## Running the tests
```
nf-test test
```
