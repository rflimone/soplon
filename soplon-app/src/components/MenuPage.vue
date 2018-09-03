<template>
  <v-ons-page>
    <v-ons-toolbar modifier="transparent"></v-ons-toolbar>
    <div class="header">
      <img src="../assets/logo.png">
    </div>

    <v-ons-list>
      <v-ons-list-item v-for="(item, index) in access" :key="item.title"
        :modifier="md ? 'nodivider' : ''"
        @click="loadView(index)"
      >
        <div class="left">
          <v-ons-icon fixed-width class="list-item__icon" :icon="item.icon"></v-ons-icon>
        </div>
        <div class="center">
          {{ item.title }}
        </div>
        <div class="right">
          <v-ons-icon icon="fa-link"></v-ons-icon>
        </div>
      </v-ons-list-item>
    </v-ons-list>

  </v-ons-page>
</template>

<script>
export default {
  name: 'menu',
  data () {
    return {
      access: [
        {
          title: 'Inicio',
          icon: 'ion-home, material:md-home'
        },
        {
          title: 'Subscribirse',
          icon: 'ion-edit, material:md-edit'
        },
        {
          title: 'Configuración',
          icon: 'ion-gear-b, material: md-movie-alt'
        }
      ]
    }
  },
  methods: {
    loadView (index) {
      this.$store.commit('splitter/toggle')
    },
    loadLink (url) {
      window.open(url, '_blank')
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
.header {
  text-align: center;
  margin-bottom: 20px;
}

img {
  max-width: 150px;
}

ons-list-item {
  cursor: pointer;
}
</style>
