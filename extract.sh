#!/bin/bash

args=("$@")
revs=${args[0]}
style=${args[1]}
outdir=${args[2]}

main() {
    mkdir -p $outdir
    revisions $revs | while read rev
    do
        git checkout $rev -q
        commit=`git log -n1 $rev --pretty=format:"%ct_%h_%f" | tr '[A-Z]' '[a-z]'`
        for file in `ls -1 | grep ".\.rb"`
        do
            colorize $style $commit $file
        done
    done
    git reset --hard
    git checkout master
}

colorize() {
    infile=$3
    outfile=$3_$2.rtf
    pygmentize -O style=$style -f rtf $infile > $outdir/$outfile
}

revisions() {
    git rev-list $1
}

main
