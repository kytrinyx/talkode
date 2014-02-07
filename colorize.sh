#!/bin/bash

for file in `ls -1 . | grep .rb`
do
  outfile="colorized/`basename $file .rb`.rtf"
  style="style=overkill"
  font="fontface=Source Code Pro"
  lexer="ruby"
  format="rtf"
  pygmentize -l $lexer -P $style -P "$font" -f $format -o $outfile $file
done
