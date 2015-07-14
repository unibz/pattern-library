'use strict';

var gulp = require('gulp');
var del = require('del');
var config   = require('../config');

gulp.task('clean', function(cb){
  del([config.destFolder + '/css', config.destFolder + '/js', config.destFolder + '/images'], {dot: true, force: true}, cb);
});