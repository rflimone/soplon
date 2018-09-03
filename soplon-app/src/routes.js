import Manga from '@/views/Manga'
import Home from '@/views/HomePage'

let routes = [
  {
    name: 'home',
    path: '/',
    component: Home

  },
  {
    name: 'Manga',
    path: '/Manga',
    component: Manga
  }
]
export default routes
