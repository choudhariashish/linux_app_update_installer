#!/bin/bash

tar -czvf update.tar.gz update/

mkdir update_pack

cat update/install.sh > update_pack/update.sh
base64 update.tar.gz >> update_pack/update.sh
