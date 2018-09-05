import Axios from 'axios'
import QueryString from 'querystring'
import LoggerService from './LoggerService'

let AuthService = {};

(function () {
  this.getToken = function (username, password) {
    return new Promise((resolve, reject) => {
      Axios.post(
        `${process.env.API_HOST}/oauth/token`,
        QueryString.stringify({
          username: username,
          password: password,
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
        resolve(response.data)
      })
    })
  }
}).apply(AuthService)

export default AuthService
