#!/bin/bash

# First we append the saved layout of workspace N to workspace M
i3-msg "workspace $1; append_layout ~/.config/i3/workspace_$1.json"

# And finally we fill the containers with the programs they had
(uxterm &)
(uxterm &)
(uxterm &)
