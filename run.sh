#!/bin/sh
set -u
#
# Checking args
#

source scripts/config.sh

#if [[ ! -d "$DATASET_DIR" ]]; then
#    echo "$DATASET_DIR does not exist. Please provide the path to the folder to process Job terminated."
#    exit 1
#fi

#if [[ ! -f "$FILE_LIST_R1" ]]; then
#  echo "$FILE_LIST_R1 does not exist. Please provide the list of files to process. Job terminated."
#  exit 1
#fi

#if [[ ! -f "$FILE_LIST_R2" ]]; then
#  echo "$FILE_LIST_R2 does not exist. Please provide the list of files to process. Job terminated."
#  exit 1
#fi

#
# Job submission
#

PREV_JOB_ID=""
ARGS="-q $QUEUE -W group_list=$GROUP -M $MAIL_USER -m $MAIL_TYPE"

#
## 01-run assemblies
#

PROG="01-run-assemblies"
export STDERR_DIR="$SCRIPT_DIR/err/$PROG"
export STDOUT_DIR="$SCRIPT_DIR/out/$PROG"

init_dir "$STDERR_DIR" "$STDOUT_DIR"

JOB_ID=`qsub $ARGS -v STDERR_DIR,STDOUT_DIR,SCRIPT_DIR -N run_test -e "$STDERR_DIR" -o "$STDOUT_DIR" $SCRIPT_DIR/run_workflow.sh`

if [ "${JOB_ID}x" != "x" ]; then
    echo Job: \"$JOB_ID\"
    PREV_JOB_ID=$JOB_ID  
else
    echo Problem submitting job. Job terminated
fi
    
echo "job successfully submited"




