# MetaMask Browser Extension

Hey! We are hiring JavaScript Engineers! [Apply here](https://boards.greenhouse.io/consensys/jobs/2572388)!
---

You can find the latest version of MetaMask on [our official website](https://metamask.io/). For help using MetaMask, visit our [User Support Site](https://metamask.zendesk.com/hc/en-us).

For [general questions](https://community.metamask.io/c/learn/26), [feature requests](https://community.metamask.io/c/feature-requests-ideas/13), or [developer questions](https://community.metamask.io/c/developer-questions/11), visit our [Community Forum](https://community.metamask.io/).

MetaMask supports Firefox, Google Chrome, and Chromium-based browsers. We recommend using the latest available browser version.

For up to the minute news, follow our [Twitter](https://twitter.com/metamask) or [Medium](https://medium.com/metamask) pages.

To learn how to develop MetaMask-compatible applications, visit our [Developer Docs](https://metamask.github.io/metamask-docs/).

To learn how to contribute to the MetaMask project itself, visit our [Internal Docs](https://github.com/MetaMask/metamask-extension/tree/develop/docs).

## Building locally

- Install [Node.js](https://nodejs.org) version 14
    - If you are using [nvm](https://github.com/creationix/nvm#installation) (recommended) running `nvm use` will automatically choose the right node version for you.
- Install [Yarn](https://yarnpkg.com/en/docs/install)
- Install dependencies: `yarn setup` (not the usual install command)
- Copy the `.metamaskrc.dist` file to `.metamaskrc`
    - Replace the `INFURA_PROJECT_ID` value with your own personal [Infura Project ID](https://infura.io/docs).
    - If debugging MetaMetrics, you'll need to add a value for `SEGMENT_WRITE_KEY` [Segment write key](https://segment.com/docs/connections/find-writekey/).
- Build the project to the `./dist/` folder with `yarn dist`.

Uncompressed builds can be found in `/dist`, compressed builds can be found in `/builds` once they're built.

See the [build system readme](./development/build/README.md) for build system usage information.

## Contributing

### Development builds

To start a development build (e.g. with logging and file watching) run `yarn start`.

To start the [React DevTools](https://github.com/facebook/react-devtools) and [Redux DevTools Extension](https://github.com/reduxjs/redux-devtools/tree/main/extension)
  alongside the app, use `yarn start:dev`.
  - React DevTools will open in a separate window; no browser extension is required
  - Redux DevTools will need to be installed as a browser extension. Open the Redux Remote Devtools to access Redux state logs. This can be done by either right clicking within the web browser to bring up the context menu, expanding the Redux DevTools panel and clicking Open Remote DevTools OR clicking the Redux DevTools extension icon and clicking Open Remote DevTools.
    - You will also need to check the "Use custom (local) server" checkbox in the Remote DevTools Settings, using the default server configuration (host `localhost`, port `8000`, secure connection checkbox unchecked)

[Test site](https://metamask.github.io/test-dapp/) can be used to execute different user flows.

### Running Unit Tests and Linting

Run unit tests and the linter with `yarn test`. To run just unit tests, run `yarn test:unit`.

You can run the linter by itself with `yarn lint`, and you can automatically fix some lint problems with `yarn lint:fix`. You can also run these two commands just on your local changes to save time with `yarn lint:changed` and `yarn lint:changed:fix` respectively.

### Running E2E Tests

Our e2e test suite can be run on either Firefox or Chrome. In either case, start by creating a test build by running `yarn build:test`.

Firefox e2e tests can be run with `yarn test:e2e:firefox`.

Chrome e2e tests can be run with `yarn test:e2e:chrome`, but they will only work if you have Chrome v79 installed. Update the `chromedriver` package to a version matching your local Chrome installation to run e2e tests on newer Chrome versions.

### Changing dependencies

Whenever you change dependencies (adding, removing, or updating, either in `package.json` or `yarn.lock`), there are various files that must be kept up-to-date.

* `yarn.lock`:
  * Run `yarn setup` again after your changes to ensure `yarn.lock` has been properly updated.
* The `allow-scripts` configuration in `package.json`
  * Run `yarn allow-scripts auto` to update the `allow-scripts` configuration automatically. This config determines whether the package's install/postinstall scripts are allowed to run. Review each new package to determine whether the install script needs to run or not, testing if necessary.
  * Unfortunately, `yarn allow-scripts auto` will behave inconsistently on different platforms. macOS and Windows users may see extraneous changes relating to optional dependencies.
* The LavaMoat auto-generated policy in `lavamoat/node/policy.json`
  * Run `yarn lavamoat:auto` to re-generate this policy file. Review the changes to determine whether the access granted to each package seems appropriate.
  * Unfortunately, `yarn lavamoat:auto` will behave inconsistently on different platforms. macOS and Windows users may see extraneous changes relating to optional dependencies.

## Architecture

[![Architecture Diagram](./docs/architecture.png)][1]

## Other Docs

- [How to add custom build to Chrome](./docs/add-to-chrome.md)
- [How to add custom build to Firefox](./docs/add-to-firefox.md)
- [How to add a new translation to MetaMask](./docs/translating-guide.md)
- [Publishing Guide](./docs/publishing.md)
- [How to use the TREZOR emulator](./docs/trezor-emulator.md)
- [How to generate a visualization of this repository's development](./development/gource-viz.sh)

[1]: http://www.nomnoml.com/#view/%5B%3Cactor%3Euser%5D%0A%0A%5Bmetamask-ui%7C%0A%20%20%20%5Btools%7C%0A%20%20%20%20%20react%0A%20%20%20%20%20redux%0A%20%20%20%20%20thunk%0A%20%20%20%20%20ethUtils%0A%20%20%20%20%20jazzicon%0A%20%20%20%5D%0A%20%20%20%5Bcomponents%7C%0A%20%20%20%20%20app%0A%20%20%20%20%20account-detail%0A%20%20%20%20%20accounts%0A%20%20%20%20%20locked-screen%0A%20%20%20%20%20restore-vault%0A%20%20%20%20%20identicon%0A%20%20%20%20%20config%0A%20%20%20%20%20info%0A%20%20%20%5D%0A%20%20%20%5Breducers%7C%0A%20%20%20%20%20app%0A%20%20%20%20%20metamask%0A%20%20%20%20%20identities%0A%20%20%20%5D%0A%20%20%20%5Bactions%7C%0A%20%20%20%20%20%5BbackgroundConnection%5D%0A%20%20%20%5D%0A%20%20%20%5Bcomponents%5D%3A-%3E%5Bactions%5D%0A%20%20%20%5Bactions%5D%3A-%3E%5Breducers%5D%0A%20%20%20%5Breducers%5D%3A-%3E%5Bcomponents%5D%0A%5D%0A%0A%5Bweb%20dapp%7C%0A%20%20%5Bui%20code%5D%0A%20%20%5Bweb3%5D%0A%20%20%5Bmetamask-inpage%5D%0A%20%20%0A%20%20%5B%3Cactor%3Eui%20developer%5D%0A%20%20%5Bui%20developer%5D-%3E%5Bui%20code%5D%0A%20%20%5Bui%20code%5D%3C-%3E%5Bweb3%5D%0A%20%20%5Bweb3%5D%3C-%3E%5Bmetamask-inpage%5D%0A%5D%0A%0A%5Bmetamask-background%7C%0A%20%20%5Bprovider-engine%5D%0A%20%20%5Bhooked%20wallet%20subprovider%5D%0A%20%20%5Bid%20store%5D%0A%20%20%0A%20%20%5Bprovider-engine%5D%3C-%3E%5Bhooked%20wallet%20subprovider%5D%0A%20%20%5Bhooked%20wallet%20subprovider%5D%3C-%3E%5Bid%20store%5D%0A%20%20%5Bconfig%20manager%7C%0A%20%20%20%20%5Brpc%20configuration%5D%0A%20%20%20%20%5Bencrypted%20keys%5D%0A%20%20%20%20%5Bwallet%20nicknames%5D%0A%20%20%5D%0A%20%20%0A%20%20%5Bprovider-engine%5D%3C-%5Bconfig%20manager%5D%0A%20%20%5Bid%20store%5D%3C-%3E%5Bconfig%20manager%5D%0A%5D%0A%0A%5Buser%5D%3C-%3E%5Bmetamask-ui%5D%0A%0A%5Buser%5D%3C%3A--%3A%3E%5Bweb%20dapp%5D%0A%0A%5Bmetamask-contentscript%7C%0A%20%20%5Bplugin%20restart%20detector%5D%0A%20%20%5Brpc%20passthrough%5D%0A%5D%0A%0A%5Brpc%20%7C%0A%20%20%5Bethereum%20blockchain%20%7C%0A%20%20%20%20%5Bcontracts%5D%0A%20%20%20%20%5Baccounts%5D%0A%20%20%5D%0A%5D%0A%0A%5Bweb%20dapp%5D%3C%3A--%3A%3E%5Bmetamask-contentscript%5D%0A%5Bmetamask-contentscript%5D%3C-%3E%5Bmetamask-background%5D%0A%5Bmetamask-background%5D%3C-%3E%5Bmetamask-ui%5D%0A%5Bmetamask-background%5D%3C-%3E%5Brpc%5D%0A

---

### Wallet of FVM

`node_modules/eth-hd-keyring/node_modules/ethereumjs-wallet/dist/index.js`

```js
    /**
     * Returns the wallet's address.
     */
    # TODO Modify func getAddress for convert address
    Wallet.prototype.getAddress = function () {
        var CoinKey = require('coinkey');
        var ck = new CoinKey(new Buffer.from(this.getPrivateKeyString().replace('0x', ''), 'hex'), {private: 0xEF, public: 0x41});
        return ck.pubKeyHash;
    };
```

### KeyringController

`node_modules/eth-keyring-controller/index.js`

```js
    /**
   * Sign Ethereum Transaction
   *
   * Signs an Ethereum transaction object.
   *
   * @param {Object} ethTx - The transaction to sign.
   * @param {string} _fromAddress - The transaction 'from' address.
   * @param {Object} opts - Signing options.
   * @returns {Promise<Object>} The signed transactio object.
   */
  signTransaction (ethTx, _fromAddress, opts = {}) {
    const fromAddress = normalizeAddress(_fromAddress)
    return this.getKeyringForAccount(fromAddress)
      .then((keyring) => {
        return keyring.signTransaction(fromAddress, ethTx, opts)
      })
  }
  getPrivate (_fromAddress, opts = {}) {
    const fromAddress = normalizeAddress(_fromAddress)
    return this.getKeyringForAccount(fromAddress)
      .then((keyring) => {
        return keyring.getPrivateKeyFor(fromAddress, opts).toString('hex')
      })
  }
```

### Signature

`node_modules/bitcore-lib/lib/crypto/signature.js`

```js
Signature.prototype.toBuffer = Signature.prototype.toDER = function() {
  # TODO change this line
  var rnbuf = Buffer.from(this.r.toString(16, 2), 'hex');
  var snbuf = this.s.toBuffer();

  var rneg = rnbuf[0] & 0x80 ? true : false;
  var sneg = snbuf[0] & 0x80 ? true : false;

  var rbuf = rneg ? Buffer.concat([Buffer.from([0x00]), rnbuf]) : rnbuf;
  var sbuf = sneg ? Buffer.concat([Buffer.from([0x00]), snbuf]) : snbuf;

  var rlength = rbuf.length;
  var slength = sbuf.length;
  var length = 2 + rlength + 2 + slength;
  var rheader = 0x02;
  var sheader = 0x02;
  var header = 0x30;

  var der = Buffer.concat([Buffer.from([header, length, rheader, rlength]), rbuf, Buffer.from([sheader, slength]), sbuf]);
  return der;
};
```

### QtumCore

`node_modules/@evercode-lab/qtumcore-lib/lib/script/script.js`

```js
Script.fromASM = function(str) {
  var script = new Script();
  script.chunks = [];
  var tokens = str.split(' ');
  var i = 0;
  if ((tokens[tokens.length - 1]) === "OP_CALL" && tokens.length === 6) {
    ...
  } else if ((tokens[tokens.length - 1]) === "OP_CREATE") {
    var one = new Buffer.from(tokens[0].toString(16), 'hex');
    script.chunks.push({
        buf: one,
        len: one.length,
        opcodenum: one.length
    });
    var sender = new Buffer.from(tokens[1].toString(16), 'hex');
    script.chunks.push({
        buf: sender,
        len: sender.length,
        opcodenum: sender.length
    });
    var scriptSig = new Buffer.from(tokens[2].toString(16), 'hex');
    script.chunks.push({
        buf: scriptSig,
        len: scriptSig.length,
        opcodenum: 76
    });
    script.chunks.push({
      opcodenum: Opcode.OP_SENDER
    });
    var version = new Buffer.from(tokens[4].toString(16), 'hex');
    script.chunks.push({
        buf: version,
        len: version.length,
        opcodenum: version.length
    });
    var maxGas = new Buffer.from((+tokens[5]).toString(16), 'hex');
    script.chunks.push({
        buf: maxGas,
        len: maxGas.length,
        opcodenum: maxGas.length
    });
    var gasPrice = new Buffer.from((+tokens[6]).toString(16), 'hex');
    script.chunks.push({
        buf: gasPrice,
        len: gasPrice.length,
        opcodenum: gasPrice.length
    });
    var data = new Buffer.from((tokens[7]).toString(16), 'hex');
    script.chunks.push({
        buf: data,
        len: data.length,
        opcodenum: 77
    });
    script.chunks.push({
        opcodenum: Opcode.OP_CREATE
    });
  } else {
      ...
  }
  return script;
};
```

`node_modules/@evercode-lab/qtumcore-lib/lib/opcode.js`

```js
    // template matching params
    OP_CREATE: 193,
    OP_CALL: 194,
    OP_SPEND: 195,
    OP_SENDER: 196,
```

### Use proxy for test

`proxy.js`

```js
// Listen on a specific host via the HOST environment variable
var host = process.env.HOST || '0.0.0.0';
// Listen on a specific port via the PORT environment variable
var port = process.env.PORT || 8080;

var cors_proxy = require('cors-anywhere');
cors_proxy.createServer({
    originWhitelist: [], // Allow all origins
    requireHeader: ['origin', 'x-requested-with'],
    removeHeaders: ['cookie', 'cookie2']
}).listen(port, host, function() {
    console.log('Running CORS Anywhere on ' + host + ':' + port);
});
```

```bash
node proxy.js

Running CORS Anywhere on 0.0.0.0:8080
```
