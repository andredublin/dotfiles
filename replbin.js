#!/usr/local/bin/node

// custom repl and context
var repl = require('repl');
var context = repl.start('::>>', null, null, null, true).context;

// preload modules
context.http = require('http');
context.util = require('util');
context.os = require('os');
