// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router/index'
import axios from 'axios'
import store from './store'
import iview from 'iview'
import MintUI from 'mint-ui'
import { Search } from 'mint-ui'
import 'mint-ui/lib/style.css'
import { Swipe, SwipeItem } from 'mint-ui';

import qs from 'qs'
import 'iview/dist/styles/iview.css'
axios.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded';

 // 在请求前，把数据拦截，qs处理，完了才发送请求
var myInterceptor = axios.interceptors.request.use((config) => {
  config.data = qs.stringify(config.data)
  return config
}, function (error) {
  return Promise.reject(error)
})
axios.defaults.baseURL = 'http://localhost/Thinkphp/public/vueapp/'
Vue.use(MintUI)
Vue.use(iview)
Vue.config.productionTip = false
Vue.prototype.$http = axios
Vue.prototype.$picurl = 'http://localhost/Thinkphp/public/uploads/'
/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  store,
  MintUI,
  components: { App },
  template: '<App/>'
})
