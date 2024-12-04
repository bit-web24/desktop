#!/bin/bash

PROFILE_NAME="Gruvbox Dark"
PROFILE_SLUG="gruvbox-dark"
DCONF_DIR="/org/gnome/terminal/legacy/profiles:"

# Create new profile
PROFILE=$(dconf list $DCONF_DIR/ | grep ^: | sed 's/^://g' | grep "$PROFILE_SLUG")
if [ -z "$PROFILE" ]; then
  PROFILE=$(uuidgen)
  dconf write $DCONF_DIR/list "['$PROFILE']"
  dconf write $DCONF_DIR/:$PROFILE/visible-name "'$PROFILE_NAME'"
  dconf write $DCONF_DIR/:$PROFILE/uuid "'$PROFILE'"
fi

# Set colors
dconf write $DCONF_DIR/:$PROFILE/palette "['#282828', '#cc241d', '#98971a', '#d79921', '#458588', '#b16286', '#689d6a', '#a89984', '#928374', '#fb4934', '#b8bb26', '#fabd2f', '#83a598', '#d3869b', '#8ec07c', '#ebdbb2']"
dconf write $DCONF_DIR/:$PROFILE/background-color "'#282828'"
dconf write $DCONF_DIR/:$PROFILE/foreground-color "'#ebdbb2'"
dconf write $DCONF_DIR/:$PROFILE/bold-color "'#ebdbb2'"
dconf write $DCONF_DIR/:$PROFILE/bold-color-same-as-fg "true"
dconf write $DCONF_DIR/:$PROFILE/use-theme-colors "false"
dconf write $DCONF_DIR/:$PROFILE/use-theme-background "false"

