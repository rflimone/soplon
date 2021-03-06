import Axios from 'axios'
import Store from '@/store'

let CategoryService = {};

(function () {
  this.getCategories = function () {
    return new Promise((resolve, reject) => {
      Axios.get(
        `${process.env.API_HOST}/private/categorias`,
        {
          headers: {
            'Authorization': `Bearer ${Store.getters['auth/token'].access_token}`
          }
        }
      ).then(response => {
        resolve(response.data)
      })
    })
  }
}).apply(CategoryService)

export default CategoryService
