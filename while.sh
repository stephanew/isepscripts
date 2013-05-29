#!/bin/bash

# This script counts sheeps
i=0
while True
do
  # Add one more sheep
  let i++

  # this is the text to be spoken
  if [$i -eq 1]; then
    text="$i sheep"
  else
    text="$i sheeps"
  fi


  # Print the text
  echo "$text"

  # Test if we should use the Mac OS "say" command or the Linux "espeak" command
  if ! type say > /dev/null; then
    espeak "$text"
  else
    say "$text"
  fi
done
