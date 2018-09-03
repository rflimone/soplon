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
      <p></p>
      <img src="../assets/logo.png">
    </div>

    <v-ons-list-title>Notificaciones de Entretención</v-ons-list-title>
    <v-ons-row>
      <v-ons-col>
        <v-ons-card v-for="page of pages" :key="page.label" @click="push(page.component, page.label)">
          <div class="title">{{ page.label }}</div>
          <div class="content">{{ page.desc }}</div>
        </v-ons-card>
      </v-ons-col>
      <v-ons-col>
        <v-ons-card @click="goTo('http://192.155.83.79/c/deportes')">Deportes</v-ons-card>
      </v-ons-col>
    </v-ons-row>
    <v-ons-row>
      <v-ons-col>
        <v-ons-card @click="goTo('http://192.155.83.79/c/conciertos')">Conciertos</v-ons-card>
      </v-ons-col>
      <v-ons-col>
        <v-ons-card @click="goTo('https://github.com/vuejs/awesome-vue')">awesome-vue</v-ons-card>
      </v-ons-col>
    </v-ons-row>

  </v-ons-page>
</template>

<script>
import Manga from '../views/Manga.vue'

let HomePage = {};

(function () {
  this.name = 'home'

  this.data = function () {
    return {
      category: null,
      msg: 'Soplón',
      pages: [
        {
          component: Manga,
          label: 'Manga',
          desc: 'Recibe las últimas actualizaciones de mangas, en tiempo real!'
        }
      ]
    }
  }

  this.methods = {
    goTo (url) {
      window.open(url, '_blank')
    },
    push (page, key) {
      this.$store.commit('splitter/push', {
        extends: page,
        data () {
          return {
            toolbarInfo: {
              backLabel: 'Home',
              title: key
            }
          }
        }
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
  text-transform: capitalize;
  text-align: center;
}

ons-list-title:not(:first-of-type) {
  margin-top: 30px;
}

ons-card {
  text-align: center;
}

ons-list-item,
ons-card {
  cursor: pointer;
}
</style>
