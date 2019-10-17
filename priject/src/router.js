import Vue from "vue";
import Router from "vue-router";

Vue.use(Router);

export default new Router({
  mode: "history",
  base: process.env.BASE_URL,
  routes: [
    {
      // 首页
      path: "/",
      name: "index",
      component: () => import("./views/index.vue"),
      redirect: "/home",
      children: [
        {
          path: "/home",
          component: () => import("./components/home.vue")
        }
      ]
    },
    {
      // 注册
      path: "/register",
      name: "register",
      component: () => import("./views/register.vue")
    }
  ]
});
