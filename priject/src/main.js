import Vue from "vue";
import App from "./App.vue";
import router from "./router";
// 引入ElementUI-ui
import ElementUI from "element-ui";
import "element-ui/lib/theme-chalk/index.css";
Vue.use(ElementUI);
// 配置axios
import Axios from "axios";
//连接本地后台接口服务器
Axios.defaults.baseURL = "http://127.0.0.1:8989/api/v1";

Vue.prototype.$http = Axios;
Vue.config.productionTip = false;

// 连接要互传值的组件
import Details from "./components/details.vue";
import ActionMovie from "./components/ActionMovie.vue";
// 把组件设为接收的标签
Vue.component("text-details", Details);
Vue.component("text-actionMovie", ActionMovie);

new Vue({
  router,
  render: h => h(App)
}).$mount("#app");
