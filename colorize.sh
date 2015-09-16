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
    *.rb)       lexer="ruby";     extension=".rb" ;;
    *.js)       lexer="js";       extension=".js" ;;
    *.coffee)   lexer="coffee";   extension=".coffee" ;;
    *.css)      lexer="css";      extension=".css" ;;
    *.html)     lexer="html";     extension=".html" ;;
    *.scss)     lexer="scss";     extension=".scss" ;;
    *.yaml)     lexer="yaml";     extension=".yaml" ;;
    *.yml)      lexer="yaml";     extension=".yml" ;;
    *.json)     lexer="json";     extension=".json" ;;
    *.css.erb)  lexer="css+erb";  extension=".css.erb" ;;
    *.html.erb) lexer="html+erb"; extension=".html.erb" ;;
  esac
  filename=$(basename $file $extension)${extension}.rtf
  outfile="${target_dir}/${filename}"
  pygmentize -l $lexer -P $style -P "$font" -f $format -o $outfile $file
  if [ -e "$gdrive" ]
  then
    gdrive upload ${TALKODE_GDRIVE_OPTIONS} -f "$outfile"
  fi
}

while (( "$#" ))
do
  echo $1
  colorize "$1"
  shift
done
