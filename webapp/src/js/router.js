/**
 * Created by lixy on 2016/12/10.
 */
//router
import Vue from "vue";
import VueRouter from "vue-router";
Vue.use(VueRouter);
//store
import store from "./store";

const homePage = resolve => {
    require.ensure([], () => {
        resolve(require('../pages/home/home.vue'));
    })
};
//路由拦截
{
    let hash = window.location.hash;
    if(hash === ''){
        window.location.hash = '/home';
    }
}
//定义路由
const routes = [
    {
        path: '/home',
        component: homePage
    }
];
const router = new VueRouter({
    routes
});
router.beforeEach((to,from,next) => {
    store.commit('pageLoading',{
        pageLoading:true
    });
    next();
});
router.afterEach(router => {
    store.commit('pageLoading',{
        pageLoading:false
    });
});

exports = module.exports = router;
