# Talkode

Syntax highlighting in your presentations.

Talkode provides several tools to simplify highlighting and colorizing syntax
in presentations.

## `colorize.sh`

### Synopsis

    colorize.sh FILE1 [FILE2, …]

### Description

`colorize.sh` batch colorizes Ruby and JavaScript files.

Given a file in Ruby or JavaScript with either the `.rb` or `.js` extension,
`colorize.sh` will colorize the file and output it as an RTF document. It will
optionally upload the file to Google Drive if you have the `gdrive` Google
Drive CLI client installed and configured. (Details below)

### Google Drive support

If you put the appropriate binary of the [gdrive CLI
client](https://github.com/wyncode/gdrive) in your path as `gdrive`, the
`colorize.sh` script will automatically upload the colorized file to Google
Drive for you.

## Simple highlighting

### Keynote

The easiest way to get syntax-highlighted code in keynote slides, in my opinion,
is copy the code so it's in your paste buffer, then pipe it through pygmentize
into your copy buffer and then just paste it into keynote.

That essentially looks like this:

```bash
pbpaste | pygmentize -l ruby -f rtf -P style=presentation -P fontface="Source Code Pro" | pbcopy
```

The `-P style=presentation` bit says use the color highlighting scheme called
`presentation`, which refers to the python file in this project.

### Google Slides

Google Slides makes this a bit harder. Copy and pasting just doesn't work
reliably. You have to use `colorize.sh` to create an RTF document, import the
RTF document into Google Drive, then copy and paste from that document into
slides or other documents.

## Other applications

Sometimes you want to walk through an entire git history
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

There are other ways of installing Pygments, so see [Jekyll's
Wiki](https://github.com/mojombo/jekyll/wiki/Install) (just scroll down to the
part about python and pygments).

## Keynote colors

I made a color palette for keynote that matches the `presentation.py`
color scheme, and also has some colors for slides that represent terminal output.

    ~/Library/Colors/Programming.clr

These colors are in fact not just for Keynote. They are available in all your
OS X applications that allow you to access the color palette provided by the
system. Choose the color list tab in the colors dialog and click on the
settings to open up the file in `~/Library/Colors`.
