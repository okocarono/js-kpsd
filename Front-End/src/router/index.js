import Vue from 'vue'
import Router from 'vue-router'
import HelloWorld from '@/components/HelloWorld'
import Utama from '@/components/utama'
import Les from '@/components/les'
import Ekstra from '@/components/ekstra'
import Buku from '@/components/buku'
import Rekapan from '@/components/rekapan'
import Table from '@/components/table'


Vue.use(Router)

export default new Router({
  mode: 'history',
  // base: __dirname,
  routes: [
    {
      path: '/',
      name: 'Utama',
      component: Utama
    },
    {
      path: '/les',
      name: 'Les',
      component: Les
    },
    {
      path: '/buku',
      name: 'Buku',
      component: Buku
    },
    {
      path: '/rekapan/:id',
      name: 'Rekapan',
      component: Rekapan
    },
    {
      path: '/ekstra',
      name: 'Ekstra',
      component: Ekstra
    },
    {
      path: '/table',
      name: 'Table',
      component: Table
    }
  ]
})
