import Vue from 'vue'
import App from './App.vue'
import router from './router'
// 引入ElementUI-ui
import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';
Vue.use(ElementUI);
// 配置axios
import Axios from 'axios';
//连接本地后台接口服务器
Axios.defaults.baseURL = "http://127.0.0.1:8989/api/v1";

Vue.prototype.$http = Axios;
Vue.config.productionTip = false


new Vue({
  router,
  render: h => h(App)
}).$mount('#app')
