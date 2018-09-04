<template id="home" v-if="categories">
  <v-ons-page>
    <v-ons-toolbar class="home-toolbar">
      <div class="right">
        <v-ons-toolbar-button @click="$store.commit('splitter/toggle')">
          <v-ons-icon icon="ion-navicon, material:md-menu"></v-ons-icon>
        </v-ons-toolbar-button>
      </div>
      <div class="center">{{ msg }}</div>
    </v-ons-toolbar>

    <div class="header">
      <img src="../assets/Soplon_Mesa de trabajo 1.svg">
    </div>

    <v-ons-list-title>Notificaciones de Entretención</v-ons-list-title>
    <div>
      <v-ons-row v-for="rowIndex in rows" :key="rowIndex">
        <v-ons-col>
          <v-ons-card @click="goTo(categories[getFirstIndex(rowIndex)].glosaCategoria)"
                      :class="['categoria', categories[getFirstIndex(rowIndex)].glosaCategoria.toLowerCase()]">
            <div class="title">{{ categories[getFirstIndex(rowIndex)].glosaCategoria }}</div>
            <div class="content">{{ categories[getFirstIndex(rowIndex)].resenia }}</div>
          </v-ons-card>
        </v-ons-col>
        <v-ons-col>
          <v-ons-card v-if="categories.length > getLastIndex(rowIndex)"
                      @click="goTo(categories[getLastIndex(rowIndex)].glosaCategoria)"
                      :class="['categoria', categories[getLastIndex(rowIndex)].glosaCategoria.toLowerCase()]">
            <div class="title">{{ categories[getLastIndex(rowIndex)].glosaCategoria }}</div>
            <div class="content">{{ categories[getLastIndex(rowIndex)].resenia }}</div>
          </v-ons-card>
        </v-ons-col>
      </v-ons-row>
    </div>
  </v-ons-page>
</template>

<script>
  import AuthService from '@/services/AuthService'
  import CategoryService from '@/services/CategoryService'
  import {mapGetters} from 'vuex'
  import LoggerService from '@/services/LoggerService'

  let HomePage = {};

  (function () {
    let self = null
    this.name = 'home'

    this.created = function () {
      self = this
      this.getCategories()
    }

    this.data = function () {
      return {
        categories: null,
        msg: 'Soplón'
      }
    }

    this.methods = {
      getCategories () {
        if (!this.token) {
          AuthService.getToken(this.$data.username, this.$data.password).then(function () {
            return CategoryService.getCategories()
          }).then(data => {
            LoggerService.debug('get categories, after token request', data)
            // self.$set(self.$data, 'categories', data)
            self.$data.categories = data
          })
        } else {
          CategoryService.getCategories().then(data => {
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

  .card__title {
    text-align: center;
  }

  .card__content {
    text-align: center;
  }

  .categoria {
    color: white;
    height: 200px;
  }

  .manga {
    background-color: #ffa726;
  }

  .deportes {
    background-color: #42A5F5;
  }

  .conciertos {
    background-color: #66BB6A;
  }

  .teatro{
    background-color: #26a69a;
  }

  .cultura{
    background-color: #455a64;
  }

  .anime{
    background-color: #EF5350;
  }

  .familia{
    background-color: #4527a0;
  }

</style>
