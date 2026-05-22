process RUN_NGS2COUNTS {

    input:
    path input_folder
    val ngs2counts_executable
    val ngs2counts_extra_args

    output:
        path "${input_folder}/ngs2counts/counts_*"
        path "${input_folder}/ngs2counts/run_metadata.json"
        path "${input_folder}/ngs2counts_version.txt"
        path "${input_folder}/ngs2counts_log.txt"

    script:
    """
    run_ngs2counts.sh \
        $input_folder \
        $ngs2counts_executable \
        ${ ngs2counts_extra_args ? "\"${ngs2counts_extra_args}\"" : "" }
    """
}

workflow {
    Channel
    .value(params.ngs2counts_extra_args ?: "")
    .set { ch_ngs2counts_extra_args }

    RUN_NGS2COUNTS(
        file(params.input_folder),
        file(params.ngs2counts_executable),
        ch_ngs2counts_extra_args
    )
}
