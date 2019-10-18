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
        },
        {
          path: "/Movie",
          component: () =>
            import("./components/Movie_describe/Movie_MengMianGeWang.vue")
        },
        {
          // 电影详情路由
          path: "/details",
          component: () => import("@/components/details.vue")
        },
        // 动作片
        {
          path: "/ActionMovie",
          component: () => import("./components/ActionMovie.vue")
        },
        // 喜剧片
        {
          path: "/Comedy",
          component: () => import("./components/Comedy.vue")
        },
        // 爱情片
        {
          path: "/love",
          component: () => import("./components/Love.vue")
        },
        // 科幻片
        {
          path: "/scienceFiction",
          component: () => import("./components/ScienceFiction.vue")
        },
        // 恐怖片
        {
          path: "/Horror",
          component: () => import("./components/Horror.vue")
        },
        // 剧情片
        {
          path: "/plot",
          component: () => import("./components/Plot.vue")
        },
        // 战争片
        {
          path: "/Warfare",
          component: () => import("./components/Warfare.vue")
        },
        // 纪录片
        {
          path: "/Record",
          component: () => import("./components/Record.vue")
        }
      ]
    },
    {
      // 注册
      path: "/register",
      component: () => import("./views/register.vue")
    },
    {
      path: "/login",
      component: () => import("./views/Login.vue")
    }
  ]
});
