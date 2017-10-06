#!/bin/bash
git branch|grep -v '\*'|xargs --no-run-if-empty git branch -d

