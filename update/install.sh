#!/bin/bash

# Payload start line number.
PAYLOAD_LINE=$(awk '/^__PAYLOAD_BEGINS__/ { print NR + 1; exit 0; }' $0)

WORK_DIR=.
COMPRESSED_PACK_NAME=update.tar.gz
PACK_NAME=update

tail -n +${PAYLOAD_LINE} $0 | base64 -d | cat > ${WORK_DIR}/${COMPRESSED_PACK_NAME}
tar -xvzf ${COMPRESSED_PACK_NAME}


# Do whatever with the update content.
chmod +x ${PACK_NAME}/hello
${PACK_NAME}/hello



exit 0
__PAYLOAD_BEGINS__
