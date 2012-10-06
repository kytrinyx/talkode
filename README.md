# Talkode

This project is an extremely hacky script that colorizes ruby code for a range
of git revisions.

It uses pygments (python library), and outputs .rtf.

The filename of the output is:

    <unix timestamp of commit>_<commit hash>_<sanitized commit subject>_<old filename>.rtf

## Note

The easiest way to get syntax-highlighted code in keynote slides, in my opinion,
is copy the code so it's in your paste buffer, then pipe it through pygmentize
into your copy buffer and then just paste it into keynote.

That essentially looks like this:

    pbpaste | pygmentize -l ruby -f rtf -O style=presentation | pbcopy

The `-O style=presentation` bit says use the color highlighting scheme called
`presentation`, which refers to the python file in this project.

## Pygments

I installed pygments like this:

    sudo easy_install Pygments

There are other ways of doing so, see [Jekyll's Wiki](https://github.com/mojombo/jekyll/wiki/Install)
(just scroll down to the part about python and pygments).

I've included a pygments style file that I'm calling 'presentation'.
It's based off the syntax highlighting scheme on github.

Put this in your pygments style folder. I found mine at:

    /Library/Python/2.7/site-packages/Pygments-1.5-py2.7.egg/pygments/styles

## Keynote colors

I made a color palette for keynote that matches the `presentation.py`
color scheme, and also has some colors for slides that represent terminal output.

    ~/Library/Colors/Programming.clr


## Usage

    /path/to/extract.sh abcdef..HEAD~3 presentation /tmp/code_output

