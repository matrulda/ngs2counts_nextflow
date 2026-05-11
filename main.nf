process RUN_NGS2COUNTS {
    publishDir "work/count_files/", mode: 'copy', overwrite: true

    input:
    path input_folder

    output:
    path "counts_*"

    script:
    """
    run_ngs2counts.sh $input_folder
    """
}

workflow {
    RUN_NGS2COUNTS(
        params.input_folder,
    )
}


