#!/bin/bash

echo "---Prepare Server---"
chmod -R ${DATA_PERM} ${DATA_DIR}

if [ "${START_WRANGLER}" == "false" ]; then
  echo "---Start from Wrangler disabled, putting container into sleep mode!---"
  sleep infinity
fi

echo "---Starting Wrangler---"
cd ${DATA_DIR}
${WRANGLER_START_CMD}