#!/bin/bash

s3cmd -c s3conf sync -rr --delete-removed --exclude="*.swp" public/ s3://www.yaluvu.club/
