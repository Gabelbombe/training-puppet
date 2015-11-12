#!/bin/bash
files="${@}"
tmp="$(mktemp)"
for file in ${files[@]} ; do
    echo "Working on: ${file}"

    cp "${file}" "${tmp}/${file}"

    puppet-lint --with-filename --fix --only-checks double_quoted_strings,variables_not_enclosed,single_quote_string_with_variables,quoted_booleans,hard_tabs,trailing_whitespace,2sp_soft_tabs,arrow_alignment,unquoted_file_mode,file_mode "${file}"

    diff "${file}" "${tmp}/${file}" ; echo -e "\n"
done
rm -fr "${tmp}"
