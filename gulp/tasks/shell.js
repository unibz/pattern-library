'use strict';

var gulp = require('gulp');
var shell = require('gulp-shell')

gulp.task('shell', shell.task([
  'php core/builder.php -gp'
]));