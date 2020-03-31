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
          component: () => import("./components/Home.vue")
        },
        {
          path: "/movie/:id",
          component: () => import("./components/Movie.vue")
        },
        {
          // 电影详情路由
          path: "/details/:id",
          component: () => import("./components/Details.vue")
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
        },
        // 国产剧
        {
          path: "/domesticSeries",
          component: () => import("./components/DomesticSeries.vue")
        },
        // 港台剧
        {
          path: "/htSeries",
          component: () => import("./components/HtSeries.vue")
        },
        // 日韩剧
        {
          path: "/jkSeries",
          component: () => import("./components/JkSeries.vue")
        },
        // 欧美剧
        {
          path: "/eaSeries",
          component: () => import("./components/EaSeries.vue")
        },
        // 内地综艺
        {
          path: "/inlandVariety",
          component: () => import("./components/InlandVariety.vue")
        },
        // 港台综艺
        {
          path: "/hkVariety",
          component: () => import("./components/HkVariety.vue")
        },
        // 日韩综艺
        {
          path: "/jkVariety",
          component: () => import("./components/JkVariety.vue")
        },
        // 欧美综艺
        {
          path: "/eaVariety",
          component: () => import("./components/EaVariety.vue")
        },
        // 国产动画
        {
          path: "/DomesticAnimation",
          component: () => import("./components/DomesticAnimation.vue")
        },
        // 日韩动画
        {
          path: "/jkAnimation",
          component: () => import("./components/JkAnimation.vue")
        },
        // 欧美动画
        {
          path: "/eaAnimation",
          component: () => import("./components/EaAnimation.vue")
        },
        // 港台动画
        {
          path: "/hkAnimation",
          component: () => import("./components/HkAnimation.vue")
        },
        // 海外动画
        {
          path: "/overseasAnimation",
          component: () => import("./components/OverseasAnimation.vue")
        }
      ]
    },
    {
      // 注册
      path: "/register",
      component: () => import("./views/Register.vue")
    },
    {
      path: "/login",
      component: () => import("./views/Login.vue")
    }
  ]
});
