# set_db_env_vars.inc.sh: Functions used by the set_db_env_vars script

set_db_env_vars () {
    local config_file="${1}"

    # Read in and export all name=value pairs where the name starts with PG
    # (NOTE: all whitespaces are removed from each line)
    while read -r DBVAR
    do
        eval "export ${DBVAR}"
    done < <(grep -Ee '^PG' "${config_file}" | sed 's/ //g')
}
