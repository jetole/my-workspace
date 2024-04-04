#!/bin/bash

bash "/tmp/setup-files/packages.sh"
bash "/tmp/setup-files/zsh.sh"

echo '#!/bin/bash' > /entrypoint.sh
chmod 0755 /entrypoint.sh

apt-get clean -y
