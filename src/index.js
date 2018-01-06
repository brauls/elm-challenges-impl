'use strict';

require('bootstrap/dist/css/bootstrap.min.css');
require('font-awesome/css/font-awesome.css');
require('./style/custom.scss');

require('./index.html');

var Elm = require('./Main.elm');
var mountNode = document.getElementById('main');

var app = Elm.Main.embed(mountNode);