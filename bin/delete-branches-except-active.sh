#!/bin/bash
git branch | grep -v '\*' | xargs git branch -d

