# Talkode

Extremely hacky script that colorizes ruby code given a range of git revisions.

It uses pygments (python library), and outputs .rtf.

The filename of the output is:

    <unix timestamp of commit>_<commit hash>_<sanitized commit subject>_<old filename>.rtf

## Usage

    /path/to/extract.sh abcdef..HEAD~3 monokai /tmp/xyz_service
