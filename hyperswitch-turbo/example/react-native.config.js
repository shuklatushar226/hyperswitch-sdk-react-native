const path = require('path');
const pak = require('../package.json');

module.exports = {
  project: {
    android: {
      sourceDir: 'android',
      appName: 'app',
      packageName: 'com.hyperswitchsdkreactnativeexample',
    },
  },
  dependencies: {
    [pak.name]: {
      root: path.join(__dirname, '..'),
    },
  },
};
