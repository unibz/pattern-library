# Browserify entry point for the global.js bundle (yay CoffeeScript!)
$ = require 'jquery'
# plugin = require 'plugin'

# console.log 'main.js loaded!'
# plugin()

$('.nav_item').click ->
  $('nav_item').addClass 'is-active'
  $('.nav').addClass 'is-open'
  return