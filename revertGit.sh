#!/usr/bin/env bash

tag=${1}

git checkout ${tag}
git diff master > /Users/jays/Utils/scripts/temp/diff.patch
git checkout master
cat /Users/jays/Utils/scripts/temp/diff.patch | git apply
git commit -am "Rolled back to version ${tag}"
#git push origin master
