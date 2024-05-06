#!/bin/bash

set -e
shopt -s globstar

for binderpath in binder*; do
    echo "binderpath ${binderpath}"
    find "${binderpath}" -type f ! \( -name "*.pdf" -o -name "*.tex" -o -name "*.bib" \) -exec rm -f {} +
done

find . -type f -name '*.png' -exec rm -f {} +
find . -type f -name '*.jpg' -exec rm -f {} +
find . -type d -name dishtiny -exec rm -rf {} +
find . -type d -name hstrat -exec rm -rf {} +
find . -type d -name conduit -exec rm -rf {} +
find . -type d -name docs -exec rm -rf {} +
find . -type d -empty -delete
find . -type l -delete

rm -rf binder-surface-concept/teeplots/0*
rm -rf bindertex-evolutionary-inference/img
rm -rf binder-reconstruction-quality
rm -rf binder-surface-concept

rm -f arxiv.tar.gz
git checkout bibl.bib
make cleaner
make
make clean
mv bibl.bib main.bib
cp tex-extended-abstract-draft.bbl main.bbl
cp tex-extended-abstract-draft.blg main.blg
tar -czvf arxiv.tar.gz *
