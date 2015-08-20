$ = require 'jquery'
_ = require 'lodash'

###
# Main Navigation
#
# How to use
#
# 1. add the class .js-nav on nav section elements plus the data-nav-level
#    with level 1, 2 or 3 or higher
# 2. add the class .js-nav_item on the clickable nav items
# 3. add the data attribute data-toggle-elem with the selector
#    of the item to toggle on .js-nav_item elements
###
class Navigation

  # cache dom elements and init event listeners
  init: ->
    @$ui =
      body: $('body')
      nav: $('.js-nav')
      navItems: $('.js-nav_item')
      header: $('.js-header')

    @$ui.navItems.on 'click', _.bind(@toggleNavItem, this)
    @$ui.body.on 'click', _.bind(@closeNav, this)

  getLevels: ->
    _.unique @$ui.nav.map (index, el) ->
      $(el).data 'nav-level'

  getMaxLevel: ->
    _.max @getLevels()

  getNavLevel: (level) ->
    @$ui.nav.filter('[data-nav-level="' + level + '"]')

  getCurrentNavItemForLevel: (level) ->
    @getNavLevel(level).find('.js-nav_item.is-active')

  toggleNavItemState: ($navItem, onOff) ->
    $navItem.toggleClass 'is-active', onOff

  toggleNavLevel: (level, onOff) ->
    if level is 1
      @$ui.header.toggleClass 'is-open', onOff

    if not onOff
      # close all levels below and disable current active item of each of them
      childrenLevels = _.range @getMaxLevel(), level, -1

      _.each childrenLevels, (childrenLevel) =>
        @getNavLevel(childrenLevel).removeClass 'is-open'
        @toggleNavItemState @getCurrentNavItemForLevel(childrenLevel), off

  isNavLevelOpen: (level) ->
    $navLevel = if level is 1 then @$ui.header else @getNavLevel(level)
    $navLevel.hasClass 'is-open'

  closeNav: (e) ->
    $target = $(e.target)
    isNav = $target.hasClass 'js-nav'
    isNavItem = $target.hasClass 'js-nav_item'
    return if isNav or isNavItem or not @isNavLevelOpen(1)

    @toggleNavLevel(1, off)
    _.each @getLevels(), (level) =>
      @toggleNavItemState(@getCurrentNavItemForLevel(level), off)

  toggleNavItem: (e) ->
    e.preventDefault()
    $target = $(e.currentTarget)
    toggleElem = $target.data 'toggle-elem'
    return if not toggleElem

    navLevel = Number($target.closest('.js-nav').data('nav-level'))
    isNotNavItemActive = not $target.hasClass 'is-active'
    isNavLevelOpen = @isNavLevelOpen(navLevel)
    $currLevelNavItem = @getCurrentNavItemForLevel(navLevel)
    hasCurrLevelNavItem = $currLevelNavItem.length isnt 0

    # check whether the element is on the same level of the currently active one
    if hasCurrLevelNavItem and $currLevelNavItem.get(0) isnt $target.get(0)
      # if yes, disable currently active element
      @toggleNavItemState $currLevelNavItem, off
      # and also the active elements of lower levels
      @toggleNavLevel navLevel, off

    @toggleNavLevel navLevel, isNotNavItemActive
    @toggleNavItemState $target, isNotNavItemActive
    $(toggleElem).toggleClass 'is-open', isNotNavItemActive

# return singleton, because there can be only one main navigation
module.exports = new Navigation()