require("babel-polyfill");
import Vue from "vue";
//store
import store from "./store";
//router
import router from "./router.js";
//mint-ui
import MintUI from 'mint-ui';
import 'mint-ui/lib/style.css'
Vue.use(MintUI);
//components
import pageLoading from "../components/common/page-loading.vue";
Vue.component('page-loading',pageLoading);

const app = new Vue({
    router,
    store
}).$mount("#view");
