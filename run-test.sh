#!/bin/sh
cd "$(dirname "$0")"

if [ ! -d test/vader.vim ]; then
  git clone --depth 1 https://github.com/junegunn/vader.vim test/vader.vim
fi

vim --not-a-term -Nu test/vimrc '+Vader! test/*.vader' 2>&1 | \
  perl -pe 's/\e[\[\]>][0-9;?]*[a-zA-Z]//g; s/\e[>=]//g' | \
  grep -E '(^Vader|^Starting|^  Starting|^    \(|^  Success|^Success|^Elapsed)'
