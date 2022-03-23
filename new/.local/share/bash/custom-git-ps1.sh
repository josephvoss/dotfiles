#!/bin/bash
#
# Helper function to get the current branch name from git everytime the prompt
# is called. Written to cut out the crud from git-prompt.sh that made it stall
# my command line
#

function __custom_git_ps1()
{
  if [[ "true" = "$(git rev-parse --is-inside-work-tree 2>/dev/null)" ]]; then
    echo "($(git rev-parse --abbrev-ref HEAD))"
  else
    echo ""
  fi
}
