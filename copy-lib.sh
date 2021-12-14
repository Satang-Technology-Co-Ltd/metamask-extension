#!/bin/bash
echo "copy node_modules/eth-hd-keyring/node_modules/ethereumjs-wallet/dist/index.js:401"
cp custom-lib/eth-hd-keyring.js node_modules/eth-hd-keyring/node_modules/ethereumjs-wallet/dist/index.js

echo "copy node_modules/eth-simple-keyring/node_modules/ethereumjs-wallet/dist/index.js:401"
cp custom-lib/eth-simple-keyring.js node_modules/eth-simple-keyring/node_modules/ethereumjs-wallet/dist/index.js

echo "copy node_modules/eth-keyring-controller/index.js:366"
cp custom-lib/eth-keyring-controller.js node_modules/eth-keyring-controller/index.js

echo "copy node_modules/bitcore-lib/lib/crypto/signature.js:168"
cp custom-lib/signature.js node_modules/bitcore-lib/lib/crypto/signature.js

echo "copy node_modules/@evercode-lab/qtumcore-lib/lib/script/script.js:133"
cp custom-lib/script.js node_modules/@evercode-lab/qtumcore-lib/lib/script/script.js
