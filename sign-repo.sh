#!/bin/bash

# x86_64
pushd ikubakus-reserve/os/x86_64
rm *.sig
rm *.old
mv ikubakus-reserve.db ikubakus-reserve.db.tar.gz
for pkg in $(ls *.zst)
do
    gpg --detach-sign --use-agent --no-armor -u 00840ACBA2AA70E7 "$pkg"
    repo-add -v -s -k 00840ACBA2AA70E7 ikubakus-reserve.db.tar.gz "$pkg"
done
popd
