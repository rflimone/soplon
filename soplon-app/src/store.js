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
        }
      }
    },
    auth: {
      namespaced: true,
      state: {
        token: JSON.parse(localStorage.getItem('auth')),
        user: JSON.parse(localStorage.getItem('user'))
      },
      mutations: {
        token (state, value) {
          state.token = value
        }
      },
      actions: {
        token (context, token) {
          let storage = {}
          Object.keys(token).map((key) => {
            storage[key] = token[key]
          })
          localStorage.setItem('auth', JSON.stringify(storage))
          context.commit('token', storage)
        }
      },
      getters: {
        token: state => state.token
      }
    },
    form: {
      namespaced: true,
      state: {
        isSubmiting: false,
        errorStates: {}
      },
      mutations: {
        setSubmiting (state, value) {
          state.isSubmiting = value
        },
        addError (state, obj) {
          state.errorStates = Object.assign({}, state.errorStates, obj)
        }
      },
      actions: {
        submit (context, value) {
          context.commit('setSubmiting', value)
        },
        error (context, obj) {
          context.commit('addError', obj)
        }
      },
      getters: {
        errors (state) {
          return Object.keys(state.errorStates).filter((key) => state.errorStates[key])
        },
        'error-states' (state) {
          return state.errorStates
        },
        isSubmiting (state) {
          return state.isSubmiting
        }
      }
    }
  }
})
