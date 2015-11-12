#!/bin/bash
backup_files="${@}"
for x in ${backup_files[@]} ; do
    echo $x
    cp "$x" "/tmp/${x}"
    puppet-lint --fix --only-checks double_quoted_strings,variables_not_enclosed,single_quote_string_with_variables,quoted_booleans,hard_tabs,trailing_whitespace,2sp_soft_tabs,arrow_alignment,unquoted_file_mode,file_mode "$x"
    diff "$x" "/tmp/$x"
    echo -e "\n\n" ; rm -f "/tmp/${x}"
done





