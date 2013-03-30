#!/usr/local/bin/node

var repl = require('repl');
var context = repl.start({
  prompt: '::>> ',
  useColors: true,
  ignoreUndefined: true
}).on('exit', function() {
  console.log('Exiting node REPL');
  process.exit();
});

// preload modules
context.http = require('http');
context.util = require('util');
context.os = require('os');
