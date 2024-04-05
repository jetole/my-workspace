#!/bin/bash

bash "/tmp/build-files/packages.sh"
bash "/tmp/build-files/zsh.sh"

echo '#!/bin/bash' > /entrypoint.sh
chmod 0755 /entrypoint.sh

apt-get clean -y
