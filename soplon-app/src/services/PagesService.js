import Axios from 'axios'
import Store from '@/store'

let PagesService = {};

(function () {
  this.getPagesByCategory = function (category) {
    return new Promise((resolve, reject) => {
      Axios.get(
        `${process.env.API_HOST}/private/paginas`,
        {
          params: {
            categoria: category
          },
          headers: {
            'Authorization': `Bearer ${Store.getters['auth/token'].access_token}`
          }
        }
      ).then(response => {
        resolve(response.data)
      })
    })
  }
}).apply(PagesService)

export default PagesService
