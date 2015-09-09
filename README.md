# Talkode

The easiest way to get syntax-highlighted code in keynote slides, in my opinion,
is copy the code so it's in your paste buffer, then pipe it through pygmentize
into your copy buffer and then just paste it into keynote.

That essentially looks like this:

```plain
pbpaste | pygmentize -l ruby -f rtf -P style=presentation -P fontface="Source Code Pro" | pbcopy
```

The `-P style=presentation` bit says use the color highlighting scheme called
`presentation`, which refers to the python file in this project.

On the other hand, sometimes you want to walk through an entire git history
and colorize each step, or batch colorize a bunch of files.

Take a look at `extract.sh` and `colorize.sh` for a very hacky approach to doing that.

## `extract.sh`

This is an extremely hacky script that colorizes ruby code for a range of git revisions.

It uses pygments (python library), and outputs .rtf.

The filename of the output is:

```plain
<unix timestamp of commit>_<commit hash>_<sanitized commit subject>_<old filename>.rtf
```

### Usage

```plain
/path/to/extract.sh abcdef..HEAD~3 presentation /tmp/code_output
```

## Pygments

I installed pygments for the Python interpreter like this:

    sudo easy_install Pygments

If you are using Python via Homebrew, then the command is

   easy_install Pygments

There are other ways of doing so, see [Jekyll's Wiki](https://github.com/mojombo/jekyll/wiki/Install)
(just scroll down to the part about python and pygments).


## Keynote colors

I made a color palette for keynote that matches the `presentation.py`
color scheme, and also has some colors for slides that represent terminal output.

    ~/Library/Colors/Programming.clr
