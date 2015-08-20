# Browserify entry point for the global.js bundle (yay CoffeeScript!)
$ = require 'jquery'
# plugin = require 'plugin'
navigation = require './navigation'

# console.log 'main.js loaded!'
# plugin()
$ ->
  # init main navigation
  navigation.init()

  # Nav mobile
  $('.utility_hamburger').on 'click', (e) ->
    e.preventDefault()
    $(this).toggleClass 'is-open'
    $('.js-header').toggleClass 'is-open'
    $('main').toggleClass 'is-under'
    $('#nav-mobile').toggleClass 'is-open'

  $('.navMobile_item').on 'click', (e) ->
    e.preventDefault()
    $(this).toggleClass 'is-open'
    $('#nav-mobile-second').addClass 'is-open'

  $('#nav-mobile-second .navMobile_item').on 'click', (e) ->
    e.preventDefault()
    $(this).addClass 'is-open'
    $('#nav-mobile-third').addClass 'is-open'