<template id='Login'>
  <ons-page>
    <div class="header">
      <img src="../assets/Soplon_Mesa de trabajo 1.svg">
    </div>
    <div class="input">
      <p>
        <ons-input id="username" modifier="underbar" placeholder="Email" float v-model.trim="username"></ons-input>
      </p>
      <p>
        <ons-input id="password" modifier="underbar" type="password" placeholder="Password" float v-model.trim="password"></ons-input>
      </p>
      <p>
        <ons-button @click="logIn" class="btn_login">Iniciar Sesión</ons-button>
      </p>
    </div>
  </ons-page>
</template>

<script>
import { mapGetters } from 'vuex'
import AuthService from '@/services/AuthService'
import Logger from '@/services/LoggerService'

let Login = {};

(function () {
  let self = null
  this.name = 'login'

  this.created = function () {
    self = this
    this.logIn()
  }

  this.data = function () {
    return {
      msg: 'Soplón',
      username: null, // 'rflimone@gmail.com',
      password: null // 'testSoplon'
    }
  }

  this.methods = {
    logIn () {
      this.$store.dispatch('form/error', {
        username: false,
        password: false
      })
      if (this.$data.username === null || this.$data.username === '') {
        this.$store.dispatch('form/error', { username: true })
      }
      if (this.$data.password === null || this.$data.password === '') {
        this.$store.dispatch('form/error', { password: true })
      }

      if (this.$store.getters['form/errors'].length > 0) {
        return
      }
      Logger.debug(`login attemp with: ${this.$data.username}`)
      AuthService.getToken(this.$data.username, this.$data.password).then(token => {
        Logger.debug(`saving token in the local storage for: ${self.$data.username}`, token)
        self.$store.dispatch('auth/token', token)
        self.$router.push({path: '/HomePage'})
      })
    }
  }

  this.computed = {
    ...mapGetters({
      token: 'auth/token'
    })
  }
}).apply(Login)

export default Login
</script>

<style scoped>
  .header {
    text-align: center;
  }
  .input{
    text-align: center;
    margin-top: 30px
  }
  .btn_login{
    margin-top: 30px;
  }
</style>
