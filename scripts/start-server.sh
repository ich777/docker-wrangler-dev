#!/bin/bash

if [ "${START_WRANGLER}" == "false" ]; then
  echo "---Start from Wrangler disabled, putting container into sleep mode!---"
  sleep infinity
fi

echo "---Starting Wrangler---"
cd ${DATA_DIR}
${WRANGLER_START_CMD}