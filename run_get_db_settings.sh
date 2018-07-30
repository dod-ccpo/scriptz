# get_db_settings: Reads postgres related settings from all of the relevant
#                  config files and then sets them as environment variables

# Load get_db_settings_functions functions
source ./script/include/get_db_settings_functions.inc.sh

# Start with the values in the base file
set_db_env_vars "./config/base.ini"

# If FLASK_ENV is set, and a config file exists for it,
# allow it to override the defaults
if [ "${FLASK_ENV}x" != "x" ]; then
    flask_env_config_file="./config/${FLASK_ENV}.ini"

    if [ -f "${flask_env_config_file}" ]; then
        set_db_env_vars "${flask_env_config_file}"
    fi
fi

# If an OVERRIDE config has been specified, and the file is present, 
# allow it to override everything else
if [ ! -z "${OVERRIDE_CONFIG_FULLPATH+is_not_set}" ] && 
   [ -f "${OVERRIDE_CONFIG_FULLPATH}" ]; then
    set_db_env_vars "${OVERRIDE_CONFIG_FULLPATH}"
fi
