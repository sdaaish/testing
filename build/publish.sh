#!/usr/bin/env bash

# Publishes Org files with emacs.
git submodule update --init org-html-themes
cp -a org-html-themes/src/ .
emacs --batch --chdir build --load publish.el --kill
