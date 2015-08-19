# Browserify entry point for the global.js bundle (yay CoffeeScript!)
$ = require 'jquery'
# plugin = require 'plugin'

# console.log 'main.js loaded!'
# plugin()
$ ->
  $('.js-nav-item').on 'click', (e) ->
    e.preventDefault()
    toggleElem = $(this).data 'toggle-elem'
    return if not toggleElem

    $target = $(this)
    $nav = $('.js-nav')
    $navItems = $('.js-nav-item')
    $header = $('.js-header')
    $main = $('.js-main')

    if $target.hasClass('js-nav-item-primary')
      $nav.removeClass 'is-open'

      if $nav.hasClass('is-active') and not $target.hasClass('is-active')
        $navItems.removeClass 'is-active'
        $target.addClass 'is-active'
      else
        #$nav.toggleClass 'is-active'
        $target.toggleClass 'is-active'
        $header.toggleClass 'is-open'
        $main.toggleClass 'is-under'
    
    # if $target.hasClass('js-nav-item-secondary')
    #   $target.toggleClass 'is-active'

    
    $target.toggleClass 'is-active'
    $(toggleElem).toggleClass 'is-open'

  # $('#faculties').on 'click', (e) ->
  #   e.preventDefault()
  #   $(this).toggleClass 'is-active'
  #   $('.js-header').toggleClass 'is-open'
  #   $('main').toggleClass 'is-under'
  #   $('#faculties-nav').toggleClass 'is-open'

  # $('#study-courses').on 'click', (e) ->
  #   e.preventDefault()
  #   $(this).toggleClass 'is-active'
  #   $('.js-header').toggleClass 'is-open'
  #   $('main').toggleClass 'is-under'
  #   $('#study-courses-nav').toggleClass 'is-open'

  # $('#bachelor').on 'click', (e) ->
  #   e.preventDefault()
  #   $(this).toggleClass 'is-active'
  #   $('#bachelor-grid').toggleClass 'is-open'

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