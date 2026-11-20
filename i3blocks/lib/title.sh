#!/bin/bash

i3-msg -t get_tree |
jq -r '
  .. | objects |
  select(.focused? == true) |
  .name // empty
' | head -n1
