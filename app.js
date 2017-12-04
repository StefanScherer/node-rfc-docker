'use strict';

const rfc = require('node-rfc');

const client = new rfc.Client({ dest: 'yourdest' }, true);

console.log('All libs loaded.');
