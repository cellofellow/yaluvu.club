#!/bin/bash

s3cmd -c s3conf sync -rr --delete-removed public/ s3://www.yaluvu.club/
