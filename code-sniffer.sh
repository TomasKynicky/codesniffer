#!/bin/bash
set -e
echo "Project Code Sniffer";

mkdir -p .qa/phpcs

if [ ! -f .qa/phpcs/.gitignore ]; then
    cp /src/default/.gitignore .qa/phpcs/.gitignore
fi

if [ ! -f .qa/phpcs/ruleset.xml ]; then
    cp /src/default/ruleset.xml .qa/phpcs/ruleset.xml
fi

#git add /srv/.qa/phpcs

if [[ -z "${CODE_SNIFFER_RULESET_PATH}" ]]; then
  CODE_SNIFFER_RULESET_PATH=".qa/phpcs/ruleset.xml"
else
  CODE_SNIFFER_RULESET_PATH="${CODE_SNIFFER_RULESET_PATH}"
fi

if [[ -z "${CODE_SNIFFER_PATHS}" ]]; then
  CODE_SNIFFER_PATHS="src"
else
  CODE_SNIFFER_PATHS="${CODE_SNIFFER_PATHS}"
fi

if [ "$#" -eq 0 ]; then
  php /root/.composer/vendor/bin/phpcs --standard="$CODE_SNIFFER_RULESET_PATH" --extensions=php --encoding=utf-8 --tab-width=4 -sp --colors --cache=.qa/phpcs/phpcs.cache $CODE_SNIFFER_PATHS
else
    case "$1" in
        "--fix")
            php /root/.composer/vendor/bin/phpcbf --standard="$CODE_SNIFFER_RULESET_PATH" --extensions=php --encoding=utf-8 --tab-width=4 -sp --colors $CODE_SNIFFER_PATHS
            ;;
        *)
            echo "Invalid argument"
            ;;
    esac
fi
