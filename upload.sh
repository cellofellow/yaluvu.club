#!/bin/bash

function gzip_file() {
    infile="$1"
    outfile="${1}.gz"
    gzip -9 $infile
    mv "$outfile" "$infile"

}

export -f gzip_file

function gunzip_file() {
    infile="$1"
    outfile="${1}.gz"
    mv "$infile" "$outfile"
    gunzip $outfile
}

export -f gunzip_file

find public -type f -exec bash -c 'gzip_file "$0"' {} \;

s3cmd -c s3conf sync -rr --delete-removed --exclude="*.swp" \
    --add-header='Content-Encoding: gzip' \
    --add-header='Content-Control: max-age=84600' \
    public/ s3://www.yaluvu.club/

find public -type f -exec bash -c 'gunzip_file "$0"' {} \;
