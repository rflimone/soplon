import Axios from 'axios'
// TODO: Descomentar cuando se integre token en el endpoint
// import Store from '@/store'

let CategoryService = {};

(function () {
  this.getCategories = function () {
    return new Promise((resolve, reject) => {
      Axios.get(
        `${process.env.API_HOST}/categoria/get-all.json`
        /* {
          headers: {
            'Authorization': `Bearer ${Store.getters['auth/token'].access_token}`
          }
        } */
      ).then(response => {
        resolve(response.data)
      })
    })
  }
}).apply(CategoryService)

export default CategoryService
