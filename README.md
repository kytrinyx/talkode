# Talkode

Extremely hacky script that colorizes ruby code given a range of git revisions.

It uses pygments (python library), and outputs .rtf.

The filename of the output is:

    <unix timestamp of commit>_<commit hash>_<sanitized commit subject>_<old filename>.rtf

## Pygments

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


