# Browserify entry point for the global.js bundle (yay CoffeeScript!)
$ = require 'jquery'
_ = require 'lodash'
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
    $('#nav-mobile').toggleClass 'is-open'

  $('.navMobile_item').on 'click', (e) ->
    e.preventDefault()
    $(this).toggleClass 'is-open'
    $('#nav-mobile-second').addClass 'is-open'

  $('#nav-mobile-second .navMobile_item').on 'click', (e) ->
    e.preventDefault()
    $(this).addClass 'is-open'
    $('#nav-mobile-third').addClass 'is-open'

  # sequential update of banner
  # can be set manually via localStorage.setItem("hero-home", 2)
  hero = parseInt(localStorage.getItem('hero-home'))
  hero = 1 unless hero
  $('.hero-home').addClass('hero-home-' + hero)
  hero = hero + 1
  hero = 1 if hero > 13
  localStorage.setItem('hero-home', hero)
  # console.log hero
    # Hero image random
    # $('.hero-home').addClass('hero-home-' + _.random(1, 13))