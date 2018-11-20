<template>
  <div class="hai">
  <ul :key="dt" v-for="dt in data">
        <li>{{dt.nama}} {{dt.umur}} </li>
    </ul>
  </div>
</template>

<script>

export default {
  props: ['data'],
  name: 'hai',
  data () {
    return {
      msg: 'Welcome to Your Vue.js App'
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style>

</style>
