import Axios from 'axios'
import QueryString from 'querystring'

let AuthService = {};

(function () {
  this.getToken = function () {
    return Promise((resolve, reject) => {
      Axios.post(
        'http://localhost:8080/oauth/token',
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
        console.log(response.data)
        localStorage.setItem('auth', JSON.stringify(response.data))
        resolve(response.data)
      })
    })
  }
}).apply(AuthService)

export default AuthService
