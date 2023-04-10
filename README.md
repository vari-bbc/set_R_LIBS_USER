# set_R_LIBS_USER
Set R_LIBS_USER environment variable based on new or old cluster.

## Motivation

We are in a transition period between two different versions of a High Performance Cluster (HPC).
There is an "old" cluster and a "new" cluster. The old and new clusters share the same file system. So, a users's home directory is the same on both clusters; e.g. a file created on the new cluster will also exist on the old cluster. Someone using R may encounter a problem related to the compiled components of packages installed in their personal R library. Due to the significantly different libraries and header files included in the operating systems between the two clusters, it is very common for a compiled file to *not* work on the old cluster if it was compiled on the new cluster (and vice-versa). In this transition period when people are using R on both clusters, it is useful to maintain two different personal R libraries -- one for the old cluster and one for the new cluster. That is what this script will help use. It sets the R_LIBS_USER environment variable based on the version of the Linux kernel from the `uname -r` command. If the script detects a Linux kernel in the 3-series, it sets the R_LIBS_USER environment variable to the "old" cluster R personal library. If the script detects a Linux kernel in the 5-series, it sets the R_LIBS_USER environment variable to the "new" cluster R personal library directory.

## Usage

For this script to work, you need to make sure that your personal R library directories are named as the script expects. The current version of R is 4.2.X. Personal R libraries for version 4.2.X are commonly in this path:

`~/R/x86_64-pc-linux-gnu-library/4.2`

Rename that directory to `~/R/x86_64-pc-linux-gnu-library/4.2-old`.

Then, create another directory called `~/R/x86_64-pc-linux-gnu-library/4.2-new`.

Now, `4.2-old` will be used on the old HPC and `4.2-new` will be used for R packages that get installed while you're using the new HPC.

To use this script at any given time:

`. /path/to/script/set_R_LIBS.sh`

You can also add that line to your .bashrc or, preferably, your .bash_profile file to have it happen automatically when you log in.

Note: simply running the script *does not* set the R_LIBS_USER environment variable.
You need to "source" it as above -- using the `. ` before the script.

The script has one option, `-v`. If you call the script with `-v` it prints a short message to STDOUT about which way $R_LIBS_USER is being set. In practice, it is recommeded to not use the `-v` option unless necessary.
