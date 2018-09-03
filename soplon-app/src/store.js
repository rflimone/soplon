import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  modules: {
    splitter: {
      strict: true,
      namespaced: true,
      state: {
        open: false
      },
      mutations: {
        toggle (state, shouldOpen) {
          if (typeof shouldOpen === 'boolean') {
            state.open = shouldOpen
          } else {
            state.open = !state.open
          }
        },
        push (state, page) {
          state.stack.push(page)
        },
        pop (state) {
          if (state.stack.length > 1) {
            state.stack.pop()
          }
        },
        replace (state, page) {
          state.stack.pop()
          state.stack.push(page)
        },
        reset (state, page) {
          state.stack = [page || state.stack[0]]
        },
        options (state, newOptions = {}) {
          state.options = newOptions
        }
      }
    }
  }
})
