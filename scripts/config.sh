export CWD=$PWD
# where the dataset to prepare is
export DATASET_DIR=""
export FILE_LIST_R1=""
export FILE_LIST_R2=""
export ASSEMBLER="Megahit" # SKESA, IDBA, Spades or Megahit
export RESULT_DIR=""
# Note: provide the path of an existing folder
#place to store the scripts
export SCRIPT_DIR="$PWD/scripts"
export WORKER_DIR="$SCRIPT_DIR/workers" 
# User informations
export QUEUE="standard"
export GROUP="bhurwitz"
export MAIL_USER="aponsero@email.arizona.edu"
export MAIL_TYPE="bea"

#
# --------------------------------------------------
function init_dir {
    for dir in $*; do
        if [ -d "$dir" ]; then
            rm -rf $dir/*
        else
            mkdir -p "$dir"
        fi
    done
}

# --------------------------------------------------
function lc() {
    wc -l $1 | cut -d ' ' -f 1
}
