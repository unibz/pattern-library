# Browserify entry point for the global.js bundle (yay CoffeeScript!)
$ = require 'jquery'
# plugin = require 'plugin'

# console.log 'main.js loaded!'
# plugin()
$ ->
  $('.nav_item').on 'click', (e) ->
    e.preventDefault()
    $(this).addClass 'is-active'
    $('.header').addClass 'is-open'
    $('#nav-secondary').addClass 'is-open'

  $('#nav-secondary .nav_item').on 'click', (e) ->
    e.preventDefault()
    $(this).addClass 'is-active'
    $('#nav-grid').addClass 'is-open'