#!/bin/sh
EMAIL=""
FOLDER=""
printhelp() {

echo "
Usage: sh backup.sh [OPTION]...
  --email    Provide your email for backup
  --folder   Provide location of your folder
  -h, --help Display help file
"

}
while [ "$1" != "" ]; do
  case "$1" in
    --email )        EMAIL=$2; shift 2 ;;
    --folder )       FOLDER=$2; shift 2 ;;
    -h    | --help )	        echo "$(printhelp)"; exit; shift; break ;;
  esac
done

cd ~ && git clone https://github.com/vishnudxb/movemail.git && \
        cd movemail && ./gyb --email $EMAIL --local-folder "$FOLDER"
