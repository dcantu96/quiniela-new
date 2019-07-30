import Vue from 'vue'
import Router from 'vue-router'
import { interopDefault } from './utils'

const _47f5c3f2 = () => interopDefault(import('../pages/login.vue' /* webpackChunkName: "pages/login" */))
const _6073b951 = () => interopDefault(import('../pages/matches.vue' /* webpackChunkName: "pages/matches" */))
const _945b2d16 = () => interopDefault(import('../pages/register.vue' /* webpackChunkName: "pages/register" */))
const _1ca7bd52 = () => interopDefault(import('../pages/teams/index.vue' /* webpackChunkName: "pages/teams/index" */))
const _4d2780c6 = () => interopDefault(import('../pages/user.vue' /* webpackChunkName: "pages/user" */))
const _01333b36 = () => interopDefault(import('../pages/teams/new.vue' /* webpackChunkName: "pages/teams/new" */))
const _e3e678f8 = () => interopDefault(import('../pages/teams/_ids.vue' /* webpackChunkName: "pages/teams/_ids" */))
const _e2ab6b6c = () => interopDefault(import('../pages/teams/_id/edit.vue' /* webpackChunkName: "pages/teams/_id/edit" */))
const _125d7af0 = () => interopDefault(import('../pages/index.vue' /* webpackChunkName: "pages/index" */))

Vue.use(Router)

if (process.client) {
  if ('scrollRestoration' in window.history) {
    window.history.scrollRestoration = 'manual'

    // reset scrollRestoration to auto when leaving page, allowing page reload
    // and back-navigation from other pages to use the browser to restore the
    // scrolling position.
    window.addEventListener('beforeunload', () => {
      window.history.scrollRestoration = 'auto'
    })

    // Setting scrollRestoration to manual again when returning to this page.
    window.addEventListener('load', () => {
      window.history.scrollRestoration = 'manual'
    })
  }
}
const scrollBehavior = function (to, from, savedPosition) {
  // if the returned position is falsy or an empty object,
  // will retain current scroll position.
  let position = false

  // if no children detected and scrollToTop is not explicitly disabled
  if (
    to.matched.length < 2 &&
    to.matched.every(r => r.components.default.options.scrollToTop !== false)
  ) {
    // scroll to the top of the page
    position = { x: 0, y: 0 }
  } else if (to.matched.some(r => r.components.default.options.scrollToTop)) {
    // if one of the children has scrollToTop option set to true
    position = { x: 0, y: 0 }
  }

  // savedPosition is only available for popstate navigations (back button)
  if (savedPosition) {
    position = savedPosition
  }

  return new Promise((resolve) => {
    // wait for the out transition to complete (if necessary)
    window.$nuxt.$once('triggerScroll', () => {
      // coords will be used if no selector is provided,
      // or if the selector didn't match any element.
      if (to.hash) {
        let hash = to.hash
        // CSS.escape() is not supported with IE and Edge.
        if (typeof window.CSS !== 'undefined' && typeof window.CSS.escape !== 'undefined') {
          hash = '#' + window.CSS.escape(hash.substr(1))
        }
        try {
          if (document.querySelector(hash)) {
            // scroll to anchor by returning the selector
            position = { selector: hash }
          }
        } catch (e) {
          console.warn('Failed to save scroll position. Please add CSS.escape() polyfill (https://github.com/mathiasbynens/CSS.escape).')
        }
      }
      resolve(position)
    })
  })
}

export function createRouter() {
  return new Router({
    mode: 'history',
    base: decodeURI('/'),
    linkActiveClass: 'nuxt-link-active',
    linkExactActiveClass: 'nuxt-link-exact-active',
    scrollBehavior,

    routes: [{
      path: "/login",
      component: _47f5c3f2,
      name: "login"
    }, {
      path: "/matches",
      component: _6073b951,
      name: "matches"
    }, {
      path: "/register",
      component: _945b2d16,
      name: "register"
    }, {
      path: "/teams",
      component: _1ca7bd52,
      name: "teams"
    }, {
      path: "/user",
      component: _4d2780c6,
      name: "user"
    }, {
      path: "/teams/new",
      component: _01333b36,
      name: "teams-new"
    }, {
      path: "/teams/:ids",
      component: _e3e678f8,
      name: "teams-ids"
    }, {
      path: "/teams/:id/edit",
      component: _e2ab6b6c,
      name: "teams-id-edit"
    }, {
      path: "/",
      component: _125d7af0,
      name: "index"
    }],

    fallback: false
  })
}
