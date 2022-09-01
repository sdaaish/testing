#!/usr/bin/env bash

# Publishes Org files with emacs.
git submodule update --init vendor/org-html-themes
cp -a vendor/org-html-themes/src/ .
emacs --batch --chdir build --load publish.el --kill
