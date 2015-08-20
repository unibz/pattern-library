$ = require 'jquery'
_ = require 'lodash'

# Main Navigation
#
# How to use
#
# 1. add the class .js-nav on the nav sections plus the data-nav-level with level 1, 2 or 3  (to have more levels, change the Navigation.maxLevel setting).
# 2. add the class .js-nav_item on the clickable nav items
# 3. add the data attribute data-toggle-elem with the selector of the item to toggle on .js-nav_item elements
class Navigation

    maxLevel: 3

    # cache dom elements and init event listeners
    init: ->
        @$ui =
            nav: $('.js-nav')
            navItems: $('.js-nav_item')
            header: $('.js-header')
            main: $('.js-main')

        @$ui.navItems.on 'click', _.bind(@toggleNavItem, @)

    getNavLevel: (level)-> 
        @$ui.nav.filter('[data-nav-level="' + level + '"]')

    getCurrentNavItemForLevel: (level)->
        @getNavLevel(level).find('.js-nav_item.is-active')

    toggleNavItemState: ($navItem, onOff)->
        $navItem.toggleClass 'is-active', onOff

    toggleNavLevel: (level, onOff)->
        if level is 1
            @$ui.header.toggleClass 'is-open', onOff
            @$ui.main.toggleClass 'is-under', onOff

        if not onOff
            # close all levels below and disable current active item of each of them
            childrenLevels = _.range @maxLevel, level, -1

            _.each childrenLevels, (childrenLevel)=>
                @getNavLevel(childrenLevel).removeClass 'is-open'
                @toggleNavItemState @getCurrentNavItemForLevel(childrenLevel), off

    isNavLevelOpen: (level)->
        @getNavLevel(level).hasClass 'is-open'

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