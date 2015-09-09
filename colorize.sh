#!/bin/bash

target_dir="colorized"
font_name="Source Code Pro"
style_name="presentation"
format="rtf"

style="style=${style_name}"
font="fontface=${font_name}"

mkdir -p $target_dir

function colorize() {
  lexer=$1
  extension=$2
  for file in `ls -1 . | grep ${extension}`
  do
    filename=$(basename $file $extension).${extension}.rtf
    outfile="${target_dir}/${filename}"
    pygmentize -l $lexer -P $style -P "$font" -f $format -o $outfile $file
  done
}

colorize "ruby" ".rb"
colorize "js" ".js"
