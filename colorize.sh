#!/bin/bash

target_dir="colorized"
font_name="Courier New"
style_name="presentation"
format="rtf"

style="style=${style_name}"
font="fontface=${font_name}"

gdrive=`which gdrive`

mkdir -p $target_dir


function colorize() {
  file=$1
  case "$file" in
    *.rb) lexer="ruby"; extension=".rb" ;;
    *.js) lexer="js"; extension=".js" ;;
  esac
  filename=$(basename $file $extension)${extension}.rtf
  outfile="${target_dir}/${filename}"
  pygmentize -l $lexer -P $style -P "$font" -f $format -o $outfile $file
  if [ -e "$gdrive" ]
  then
    # Upload to Google Drive "Syntax Highlighting" folder
    gdrive upload -p 0B3wQtUcwN0sYenZHQmR2YkZaYzQ -f "$outfile"
  fi
}

while (( "$#" ))
do
  echo $1
  colorize "$1"
  shift
done
