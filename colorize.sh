#!/bin/bash

target_dir="colorized"
font_name="Courier New"
style_name="presentation"
format="rtf"

style="style=${style_name}"
font="fontface=${font_name}"

mkdir -p $target_dir

function colorize_all() {
  lexer=$1
  extension=$2
  for file in `ls -1 . | grep ${extension}`
  do
    colorize "${file}" "${lexer}" "${extension}"
  done
}

function colorize() {
  file=$1
  lexer=$2
  extension=$3
  filename=$(basename $file $extension)${extension}.rtf
  outfile="${target_dir}/${filename}"
  pygmentize -l $lexer -P $style -P "$font" -f $format -o $outfile $file
}

# colorize_all "ruby" ".rb"
# colorize_all "js" ".js"
colorize "$1" "ruby" ".rb"
