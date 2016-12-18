var webpack = require('webpack');
var path = require("path");

var config = {
    entry:{
        "common":[
            "babel-polyfill",
            "vue",
            "vue-router",
            "vuex",
            "mint-ui"
        ],
        "app":"./src/js/app.js"
    },
    output : {
        publicPath : "../js/"
    },
    module:{
        loaders:[
            {
                test:/\.(gif|png|jpg|woff|woff2|eot|ttf|svg)(\?t=\d+)?$/,
                exclude:/node_modules/,
                loader : "url-loader?limit=10000"
            },
            {
                test: /\.(js)?$/,
                exclude:/node_modules/,
                loader:'babel'
            },
            {
                test: /\.(css)?$/,
                loader:'style!css'
            },
            {
                test:/\.vue$/,
                exclude:/node_modules/,
                loader:'vue'
            }
        ]
    },
    resolve : {
        extensions : ['','.js','.jsx'],
        alias:{
            'vue$':'vue/dist/vue.js',
            'ajaxRequest':path.join(__dirname, './src/js/modules/ajaxRequest.js'),
            'utils':path.join(__dirname, './src/js/modules/utils.js')
        }
    },
    plugins:[]
};
exports = module.exports = config;