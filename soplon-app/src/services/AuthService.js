import Axios from 'axios'
import QueryString from 'querystring'
import LoggerService from './LoggerService'

let AuthService = {};

(function () {
  this.getToken = function () {
    return new Promise((resolve, reject) => {
      Axios.post(
        `${process.env.API_HOST}/oauth/token`,
        QueryString.stringify({
          username: 'rflimone@gmail.com',
          password: 'testSoplon',
          grant_type: 'password'
        }),
        {
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
          },
          auth: {
            username: 'web',
            password: 'Soplon123'
          }
        }
      ).then(response => {
        LoggerService.debug('token was obtained: ', response.data)
        localStorage.setItem('auth', JSON.stringify(response.data))
        resolve()
      })
    })
  }
}).apply(AuthService)

export default AuthService
