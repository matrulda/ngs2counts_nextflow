process RUN_NGS2COUNTS {

    input:
    path input_folder
    val ngs2counts_executable
    val library_mapping

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
        ${ library_mapping ? "--library-mapping '${library_mapping}'" : "" }
    """
}

workflow {
    Channel
    .value(params.library_mapping ?: "")
    .set { ch_library_mapping }

    RUN_NGS2COUNTS(
        file(params.input_folder),
        file(params.ngs2counts_executable),
        ch_library_mapping
    )
}
