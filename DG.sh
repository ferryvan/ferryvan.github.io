#!/bin/sh
hexo d -g
git add --all
git commit -m "from Script"
git push origin
