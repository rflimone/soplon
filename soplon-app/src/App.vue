<template>
  <v-ons-page id="app">
    <v-ons-splitter>
      <v-ons-splitter-side swipeable side="right" collapse width="250px"
        :animation="$ons.platform.isAndroid() ? 'overlay' : 'reveal'"
        :open.sync="menuIsOpen">
        <menu-page></menu-page>
      </v-ons-splitter-side>

      <v-ons-splitter-content>
        <router-view></router-view>
      </v-ons-splitter-content>
    </v-ons-splitter>
  </v-ons-page>
</template>

<script>
import MenuPage from '@/components/MenuPage'
import HomePage from '@/views/HomePage'

export default {
  name: 'app',
  computed: {
    menuIsOpen: {
      get () {
        return this.$store.state.splitter.open
      },
      set (newValue) {
        this.$store.commit('splitter/toggle', newValue)
      }
    }
  },
  components: {
    MenuPage,
    HomePage
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style>
ons-splitter-side[side=right][animation=overlay] {
  border-right: 1px solid #BBB;
}
</style>
