process RUN_NGS2COUNTS {
    publishDir "${params.input_folder}/ngs2counts/", mode: 'copy', overwrite: true

    input:
    path input_folder
    val ngs2counts_executable

    output:
    path "${params.input_folder}/ngs2counts/counts_*"
    path "${params.input_folder}/ngs2counts/run_metadata.json"
    path "${params.input_folder}/ngs2counts_version.txt"

    script:
    """
    run_ngs2counts.sh $input_folder $ngs2counts_executable
    """
}

workflow {
    RUN_NGS2COUNTS(
        file(params.input_folder),
        file(params.ngs2counts_executable),
    )
}


