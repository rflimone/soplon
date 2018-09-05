<template id="Manga">
  <v-ons-page>
    <v-ons-toolbar class="home-toolbar">
      <div class="right">
        <v-ons-toolbar-button @click="$store.commit('splitter/toggle')">
          <v-ons-icon icon="ion-navicon, material:md-menu"></v-ons-icon>
        </v-ons-toolbar-button>
      </div>
      <div class="left"><ons-back-button @click="$router.go(-1)">Categorías</ons-back-button></div>
      <div class="center">{{ category }}</div>
    </v-ons-toolbar>

    <div class="header">
      <img class="img" src="../assets/Soplon_Mesa de trabajo 1.svg">
    </div>
    <div class="search-bar">
      <v-ons-search-input class="ons-search-input" placeholder="Buscar Tag" v-model="tag"></v-ons-search-input>
    </div>
    <ul>
      <li v-for="(page, index) in pages" :key="index">
        {{ page.tituloPagina }}
      </li>
    </ul>

  </v-ons-page>
</template>

<script>
  import Logger from '@/services/LoggerService'
  import PagesService from '@/services/PagesService'

  let CategoryPage = {};
  (function () {
    let self = null
    this.name = 'category-page'

    this.data = function () {
      return {
        tag: null,
        pages: null
      }
    }

    this.created = function () {
      self = this
      this.fetchPages()
    }

    this.computed = {
      category: function () {
        return this.$route.params.category
      }
    }

    this.methods = {
      fetchPages: function () {
        Logger.debug(`selected category: ${this.category}`)
        PagesService.getPagesByCategory(this.category).then(data => {
          Logger.debug('get categories, existing token', data)
          // self.$set(self.$data, 'categories', data)
          self.$data.pages = data
        })
      }
    }

    this.watch = {
      '$route': 'fetchPages'
    }
  }).apply(CategoryPage)
  export default CategoryPage
</script>

<style scoped>

</style>
