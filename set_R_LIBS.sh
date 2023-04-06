#!/bin/bash

#TEMP=`getopt -o he:E: -- "$@"`
TEMP=`getopt -o v -- "$@"`

verbose=0

krelease=`uname -r`

majorK=`echo $krelease | cut -d '.' -f 1`

eval set -- "$TEMP"
while true ; do
    case "$1" in
        -v) verbose=1 ; shift ;;
#        -e) exp1=$2 ; shift 2 ;;
#        -E) exp2=$2 ; shift 2 ;;
        --) shift ; break ;;
        *) break ;;
    esac
done

case "$majorK" in
    "3") 
        if [[ $verbose == 1 ]]; then 
            echo "setting R_LIBS_USER for old cluster";
        fi
        export R_LIBS_USER="$HOME/R/x86_64-pc-linux-gnu-library/4.2-old"
        ;; 
    "5")
        if [[ $verbose == 1 ]]; then
            echo "setting R_LIBS_USER for new cluster";
        fi
        export R_LIBS_USER="$HOME/R/x86_64-pc-linux-gnu-library/4.2-new" ;; 
    *) break ;;
esac

