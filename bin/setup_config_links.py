#!/bin/env python3

# Create symbolic links from home area to files in the config directory
# Input links in `link_map`, with link name to target

import os

# Get dir of script, remove trailing bin to get config dir
script_dir = os.path.dirname(os.path.realpath(__file__))
config_dir = script_dir.replace('/bin','')
home_dir = os.environ['HOME']

# Map of links to build, from home to config dir location
link_map = {
        "{}/.bashrc".format(home_dir): "{}/bashrc".format(config_dir),
        "{}/.bash_profile".format(home_dir): "{}/bash_profile".format(config_dir),
        "{}/.inputrc".format(home_dir): "{}/inputrc".format(config_dir),
        "{}/.vimrc".format(home_dir): "{}/vimrc".format(config_dir),
        "{}/.vimrc_minimal".format(home_dir): "{}/vimrc_minimal".format(config_dir),
        "{}/.vimrc_plugins".format(home_dir): "{}/vimrc_plugins".format(config_dir),
        "{}/.tmux.conf".format(home_dir): "{}/tmux.conf".format(config_dir),
        "{}/.tmux_reset.conf".format(home_dir): "{}/tmux/reset.conf".format(config_dir),
        "{}/.tmux_vim.conf".format(home_dir): "{}/tmux/vim.conf".format(config_dir),
        "{}/.tmux_airline_isotope.conf".format(home_dir): "{}/tmux/airline_isotope.conf".format(config_dir),
        "{}/.tmux_airline_wal.conf".format(home_dir): "{}/tmux/airline_wal.conf".format(config_dir),
        "{}/.ssh/authorized_keys".format(home_dir): "{}/ssh/authorized_keys".format(config_dir),
        "{}/.ssh/known_hosts".format(home_dir): "{}/ssh/known_hosts".format(config_dir),
        "{}/.gitconfig".format(home_dir): "{}/gitconfig".format(config_dir),
        "{}/.local/share/bash/custom-git-ps1.sh".format(home_dir): "{}/local/share/bash/custom-git-ps1.sh".format(config_dir),
        }

# Recursively create directories for a path, mkdir -p
def create_dir_if_needed(path):
    base_dir = os.path.dirname(path)
    # Does our parent exist? If so exit
    if os.path.isdir(base_dir):
        return
    # Recurse to check grandparent
    create_dir_if_needed(base_dir)
    print("Making dir {}".format(base_dir))
    os.mkdir(base_dir)
    return

for link in link_map:
    # Check if path exists or is already a symlink
    if os.path.isfile(link) or os.path.islink(link):
        print("Skipping {}, path exists".format(link))
        continue
    create_dir_if_needed(link)
    target = link_map[link]
    os.symlink(target, link)
    print("Created link {} for {}".format(link, target))
