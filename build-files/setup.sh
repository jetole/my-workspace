#!/bin/bash

bash "/tmp/build-files/packages.sh"
bash "/tmp/build-files/zsh.sh"

echo '#!/bin/bash' > /entrypoint.sh
chmod 0755 /entrypoint.sh

# shellcheck disable=SC2016
echo 'PATH="/opt/container-toolbox/bin:$PATH"' >> /etc/zsh/zshenv

# Cleanup
apt-get clean -y
