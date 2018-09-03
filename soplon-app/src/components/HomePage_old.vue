<template>
  <v-ons-page>
    <v-ons-toolbar class="home-toolbar">
      <div class="left">
        <v-ons-toolbar-button @click="$store.commit('splitter/toggle')">
          <v-ons-icon icon="ion-navicon, material:md-menu"></v-ons-icon>
        </v-ons-toolbar-button>
      </div>
      <div class="center">{{ msg }}</div>
    </v-ons-toolbar>

    <div class="header">
      <img src="../assets/logo.png">
    </div>

    <v-ons-search-input placeholder="Search something"
                        @change="getPagesByCategory"
                        v-model="category">
    </v-ons-search-input>

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

    <v-ons-list-title>Vue.js Ecosystem</v-ons-list-title>
    <v-ons-row>
      <v-ons-col>
        <v-ons-card @click="goTo('http://router.vuejs.org/')">vue-router</v-ons-card>
      </v-ons-col>
      <v-ons-col>
        <v-ons-card @click="goTo('http://vuex.vuejs.org/')">vuex</v-ons-card>
      </v-ons-col>
    </v-ons-row>
    <v-ons-row>
      <v-ons-col>
        <v-ons-card @click="goTo('http://vue-loader.vuejs.org/')">vue-loader</v-ons-card>
      </v-ons-col>
      <v-ons-col>
        <v-ons-card @click="goTo('https://github.com/vuejs/awesome-vue')">awesome-vue</v-ons-card>
      </v-ons-col>
    </v-ons-row>

  </v-ons-page>
</template>

<script>
import Axios from 'axios'
import QueryString from 'querystring'

let HomePage = {};

(function () {
  let self = null
  this.name = 'home'

  this.created = function () {
    self = this
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
    })
  }

  this.data = function () {
    return {
      category: null,
      pages: null,
      msg: 'Welcome',
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
    goTo (url) {
      window.open(url, '_blank')
    },
    getPagesByCategory () {
      console.log(this.$data.category)
      console.log(JSON.parse(localStorage.getItem('auth')).access_token)
      Axios.get(
        'http://localhost:8080/private/paginas',
        {
          params: {
            categoria: this.$data.category
          },
          headers: {
            'Authorization': `Bearer ${JSON.parse(localStorage.getItem('auth')).access_token}`
          }
        }
      ).then(response => {
        self.$data.pages = response.data
      })
    }
  }
}).apply(HomePage)

export default HomePage
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
.header {
  text-align: center;
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
</style>
