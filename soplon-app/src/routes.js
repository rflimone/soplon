import Manga from '@/views/Manga'
import Home from '@/views/HomePage'
import Login from '@/views/Login'
import CategoryPage from '@/views/CategoryPage'

let routes = [
  {
    path: '/',
    name: 'login',
    component: Login
  },
  {
    name: 'home',
    path: '/home',
    component: Home

  },
  {
    name: 'Manga',
    path: '/Manga',
    component: Manga
  },
  {
    name: 'Category',
    path: '/Category/:category',
    component: CategoryPage
  }
]

routes.map((route) => {
  const publicAccess = [
    'login'
  ]
  if (publicAccess.indexOf(route.name) !== -1) return
  if (!route.meta) route.meta = {}
  route.meta.requiresAuth = true
})

export default routes
