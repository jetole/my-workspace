# ToDo items

- Path to built-ins i.e. /opt/container-setup
  - This can be defined in /etc/zsh/zshenv
- Create script to test if host commands exist and create symlinks in bin if they do
  - We can run something like `if /usr/bin/distrobox-host-exec podman -v`...
  - Should probably have a conditional alias for docker=podman depending on if podman is installed and docker is not installed in the zshrc
- Create bin dir as part of zshrc if it doesn't exist
- How do we create zshrc if it doesn't exist? Maybe we can define a script to run in one of the /etc/zsh files
- Create scripts to setup for home or work
- Rename project: maybe `container-toolbox`, `container-workspace`, something other than `my-workspace`
  - Kind of liking `export TERM=xterm-256color`
  - !!! decided on toolbox-container
- Figure out how to do custom shortcuts for terminal profiles
- Icon for in container
  - PTAL https://github.com/romkatv/powerlevel10k/issues/1895
- Figure out why icons and styling are wrong
  - See https://github.com/romkatv/powerlevel10k#some-prompt-styles-are-missing-from-the-configuration-wizard
  - This worked on a debian test container: `export TERM=xterm-256color`
