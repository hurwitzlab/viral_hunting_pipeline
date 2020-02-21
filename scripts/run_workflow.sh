#!/bin/bash

#PBS -l select=1:ncpus=28:mem=168gb
#PBS -l walltime=24:00:00

HOST=`hostname`
LOG="$STDOUT_DIR/${HOST}.log"
ERRORLOG="$STDERR_DIR/${HOST}.log"

if [ ! -f "$LOG" ] ; then
    touch "$LOG"
fi
echo "Started `date`">>"$LOG"
echo "Host `hostname`">>"$LOG"

cd $SCRIPT_DIR

source activate viral_hunt

snakemake -s $SCRIPT_DIR/Snakefile

echo "Finished `date`">>"$LOG"
