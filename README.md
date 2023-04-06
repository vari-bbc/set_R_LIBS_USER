# set_R_LIBS_USER
Set R_LIBS_USER environment variable based on new or old cluster.

## Motivation

We are in a transition period between two different versions of a High Performance Cluster (HPC).
There is an "old" cluster and a "new" cluster.

## Usage

To use this script at any given time:

. /path/to/script/set_R_LIBS.sh

You can also add that line to your .bashrc or .bash_profile files to have it happen automatically when you log in.

Note: running the script *does not* set the R_LIBS_USER environment variable.
You need to specifically run it as above -- using the "." before the script.

