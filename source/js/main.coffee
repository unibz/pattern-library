# Browserify entry point for the global.js bundle (yay CoffeeScript!)
$ = require 'jquery'
# plugin = require 'plugin'

# console.log 'main.js loaded!'
# plugin()
$ ->
  $('#faculties').on 'click', (e) ->
    e.preventDefault()
    $(this).toggleClass 'is-active'
    $('.header').toggleClass 'is-open'
    $('main').toggleClass 'is-under'
    $('#faculties-nav').toggleClass 'is-open'

  $('#study-courses').on 'click', (e) ->
    e.preventDefault()
    $(this).toggleClass 'is-active'
    $('.header').toggleClass 'is-open'
    $('main').toggleClass 'is-under'
    $('#study-courses-nav').toggleClass 'is-open'

  $('#bachelor').on 'click', (e) ->
    e.preventDefault()
    $(this).toggleClass 'is-active'
    $('#bachelor-grid').toggleClass 'is-open'

  # Nav mobile
  $('.utility_hamburger').on 'click', (e) ->
    e.preventDefault()
    $(this).toggleClass 'is-open'
    $('.header').toggleClass 'is-open'
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