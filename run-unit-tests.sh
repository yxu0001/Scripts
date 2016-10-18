#!/bin/bash
#
# Script to run SNACK mirth unit tests. Pass in the mirth code base.
# 
# 

function usage()
{
    echo "Script to run SNACK mirth unit tests. Pass in the mirth code base."
    echo ""
    echo "`basename $0`"
    echo -e "\t-h --help"
    echo -e "\t--codebase=\$CODE_BASE"
    echo ""
}

if [ $# -eq 0 ]
   then
   	usage
	exit
fi

while [ "$1" != "" ]; do
    PARAM=`echo $1 | awk -F= '{print $1}'`
    VALUE=`echo $1 | awk -F= '{print $2}'`
    case $PARAM in
        -h | --help)
            usage
            exit
            ;;
        --codebase)
	    echo '$VALUE='$VALUE
            CODE_BASE=$VALUE
            ;;
        *)
            echo "ERROR: unknown parameter \"$PARAM\""
            usage
            exit 1
            ;;
    esac
    shift
done


echo '$CODE_BASE='$CODE_BASE
cd $CODE_BASE/unit-tests

echo 'cd '`pwd`

GLOBAL_JS_DIR=$CODE_BASE/externalJavaScript/
echo 'GLOBAL_JS_DIR='$GLOBAL_JS_DIR

INBOUND_JS_DIR=$CODE_BASE/externalJavaScript/inbound/
echo 'INBOUND_JS_DIR='$INBOUND_JS_DIR

OUTBOUND_JS_DIR=$CODE_BASE/externalJavaScript/outbound/
echo 'OUTBOUND_JS_DIR='$OUTBOUND_JS_DIR

mvn clean surefire-report:report -Dglobal.js.dir=$GLOBAL_JS_DIR -Dinbound.js.dir=$INBOUND_JS_DIR -Doutbound.js.dir=$OUTBOUND_JS_DIR
