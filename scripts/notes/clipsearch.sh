#!/bin/bash
cat clippings | fzf --ansi --preview='ag --color -C 9 {q} clippings' --query='' --preview-window=right,50%,border-rounded,nowrap
