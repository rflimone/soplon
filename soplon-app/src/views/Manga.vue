<template id="Manga">
  <v-ons-page>
    <v-ons-toolbar class="home-toolbar">
      <div class="right">
        <v-ons-toolbar-button @click="$store.commit('splitter/toggle')">
          <v-ons-icon icon="ion-navicon, material:md-menu"></v-ons-icon>
        </v-ons-toolbar-button>
      </div>
      <div class="left"><ons-back-button @click="$router.push({path: '/home'})">Categorías</ons-back-button></div>
      <div class="center">{{ msg }}</div>
    </v-ons-toolbar>

    <div class="header">
      <img class="img" src="../assets/Soplon_Mesa de trabajo 1.svg">
    </div>
    <div class="search-bar">
      <v-ons-search-input class="ons-search-input" placeholder="Buscar Tag" @change="getPagesByCategory" v-model="category"></v-ons-search-input>
    </div>
    <ul>
      <li v-for="(page, index) in pages" :key="index">
        {{ page.tituloPagina }}
      </li>
    </ul>

    <v-ons-list-title>Vue.js Essential Links</v-ons-list-title>
    <v-ons-list>
      <v-ons-list-item v-for="item in essentialLinks" @click="goTo(item.link)" :key="item.link">
        <div class="left"><v-ons-icon fixed-width :icon="item.icon"></v-ons-icon></div>
        <div class="center">{{ item.label }}</div>
        <div class="right"><v-ons-icon icon="fa-external-link"></v-ons-icon></div>
      </v-ons-list-item>
    </v-ons-list>

  </v-ons-page>
</template>

<script>
  import AuthService from '@/services/AuthService'
  import PagesService from '@/services/PagesService'
  import {mapGetters} from 'vuex'
  import LoggerService from '@/services/LoggerService'

  let Manga = {};

  (function () {
    let self = null
    this.name = 'manga'

    this.created = function () {
      self = this
      this.getPagesByCategory()
    }

    this.data = function () {
      return {
        category: null,
        pages: null,
        msg: 'Manga',
        essentialLinks: [
          {
            label: 'Manga',
            link: 'http://192.155.83.79/c/manga',
            icon: 'fa-book'
          },
          {
            label: 'Deportes',
            link: 'http://192.155.83.79/c/deportes',
            icon: 'fa-commenting'
          },
          {
            label: 'Conciertos',
            link: 'http://192.155.83.79/c/conciertos',
            icon: 'ion-chatboxes'
          },
          {
            label: 'Teatro',
            link: 'http://192.155.83.79/c/teatro',
            icon: 'fa-twitter'
          },
          {
            label: 'Intelectuales',
            link: 'http://192.155.83.79/c/intelectuales',
            icon: 'fa-file-text'
          },
          {
            label: 'Anime',
            link: 'http://192.155.83.79/c/anime',
            icon: 'fa-file-text'
          },
          {
            label: 'Familia',
            link: 'http://192.155.83.79/c/familia',
            icon: 'fa-file-text'
          }
        ]
      }
    }

    this.methods = {
      getPagesByCategory () {
        if (!this.token) {
          AuthService.getToken(this.$data.username, this.$data.password).then(function () {
            return PagesService.getPagesByCategory()
          }).then(data => {
            LoggerService.debug('get categories, after token request', data)
            // self.$set(self.$data, 'categories', data)
            self.$data.categories = data
          })
        } else {
          PagesService.getPagesByCategory().then(data => {
            LoggerService.debug('get categories, existing token', data)
            // self.$set(self.$data, 'categories', data)
            self.$data.categories = data
          })
        }
      },
      getFirstIndex (rowIndex) {
        return rowIndex - 2 + rowIndex
      },
      getLastIndex (rowIndex) {
        return rowIndex - 1 + rowIndex
      },
      goTo (routeName) {
        this.$router.push({name: routeName})
      }
    }

    this.computed = {
      rows: function () {
        if (this.$data.categories === null) {
          return 0
        } else {
          return parseInt(this.$data.categories.length / 2) + this.$data.categories.length % 2
        }
      },
      ...mapGetters({
        token: 'auth/token'
      })
    }
  }).apply(Manga)

  export default Manga
</script>

<style >
.ons-search-input {
    position: relative;
    width: 100%;
}
</style>
<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
.header {
  text-align: center;
}

.search-bar {
  width: 100%;
}

img {
  max-width: 300px;
}

ons-list-title {
  text-transform: none;
}

ons-list-title:not(:first-of-type) {
  margin-top: 30px;
}

ons-card {
  text-align: center;
}

ons-list-item, ons-card {
  cursor: pointer;
}

.center.toolbar__center.toolbar__title.toolbar--material__center {
  text-align: center;
}
</style>
