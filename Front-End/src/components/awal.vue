<template>
  <div class="hello">
     <ambilData :coba="coba"></ambilData>
  </div>
</template>

<script>
import Akhir from './testing.vue'
export default {
  props: ['coba'],
  components: {'ambilData': Akhir},
  name: 'hello',
  data () {
    return {
      msg: 'Welcome to Your Vue.js App',
      data: [
          {'nama': 'panjul', 'umur': 20},
          {'nama': 'maya', 'umur': 45}
      ]
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>

</style>
