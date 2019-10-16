import Vue from 'vue'
import Router from 'vue-router'


Vue.use(Router)

export default new Router({
  mode: 'history',
  base: process.env.BASE_URL,
  routes: [
    {
      // 首页
      path: '/',
      name: 'index',
      component:()=> import('./views/index.vue')
    }
  ]
})
