var gulp = require("gulp");
var gutil = require("gulp-util");
var del = require("del");
var rename = require("gulp-rename");
var uglify = require("gulp-uglify");
var sass = require("gulp-sass");
var autoprefixer = require("gulp-autoprefixer");
var newer = require("gulp-newer");
var sourcemaps = require('gulp-sourcemaps');
var imagemin = require('gulp-imagemin');
//browser-sync
var bs = require('browser-sync').create();
//webpack
var webpack = require("webpack");
var webpackStream = require("webpack-stream");
var webpackConfig = require("./webpack.config.js");
var path = require('path');

//源文件路径和目标文件路径
var src = {
    html:"./src/html/**/*.html",
    style:"./src/style/**/*.scss",
    fonts:"./src/style/base/fonts/{iconfont.eot,iconfont.svg,iconfont.ttf,iconfont.woff}",
    img:"./src/style/images/**/*.*"
};
var dest = {
    html:"dist/html",
    style:"dist/style",
    fonts:"dist/style",
    img:"dist/style/images"
};

//清除
function clean(done){
    del.sync('dist');
    done();
}

//拷贝
function copyHtml(){
    return gulp.src(src.html)
        .pipe(newer(dest.html))
        .pipe(gulp.dest(dest.html));
}
function copyJs(){
    return gulp.src([
            'src/js/modules/responsive.js',
            'src/js/modules/LSresourceLoader.js',
            'src/js/vendor/zepto.js'
        ])
        .pipe(rename({ suffix: '.min' }))
        .pipe(uglify())
        .pipe(gulp.dest('dist/js'));
}
function copyFonts(){
    return gulp.src(src.fonts)
        .pipe(gulp.dest(dest.fonts));
}
function copyImg(){
    return gulp.src(src.img)
        .pipe(imagemin())
        .pipe(gulp.dest(dest.img));
}

//编译sass
function style(){
    return gulp.src(src.style)
        .pipe(newer(dest.style))
        .pipe(sourcemaps.init())
        .pipe(sass({outputStyle:'compressed'}).on('error',sass.logError))
        .pipe(sourcemaps.write())
        .pipe(autoprefixer({
            browsers:[
                "last 3 versions","iOS 7","not ie <= 9",
                "Android >= 4.0",
                "last 3 and_chr versions",
                "last 3 and_ff versions",
                "last 3 op_mob versions",
                "last 3 op_mob versions",
                "last 3 op_mini versions"
            ],
            //是否美化属性值
            cascade:true,
            //是否去掉不必要的前缀
            remove:true
        }))
        .pipe(gulp.dest(dest.style))
        .pipe(bs.reload({stream:true}));
}
exports.style = style;

//代码监控
function watcher() {
    gulp.watch("src/html/**/*.html",copyHtml);
    gulp.watch("dist/html/**/*.html").on("change",bs.reload);
    gulp.watch("src/style/**/*.scss", style);
    gulp.watch('dist/js/*.js').on("change",bs.reload);
}

//browserSync
function server(){
    bs.init({
        proxy: "http://localhost"
    });
    watcher();
}

//webpack development
function webpackWatch() {
    var devConfig = Object.create(webpackConfig);
    devConfig.output.filename = '[name].js';
    devConfig.output.chunkFilename = '[id].chunk.js';
    devConfig.plugins = devConfig.plugins.concat(
        new webpack.optimize.CommonsChunkPlugin({
            name:["common"],
            filename:"[name].js",
            minChunks: Infinity
        })
    );
    devConfig.devtool = "sourcemap";
    devConfig.watch = true;
    return gulp.src('src/js/app.js')
        .pipe(webpackStream(devConfig,null,function(err,stats){
            if (err) {
                throw new gutil.PluginError("webpack:build-dev", err);
            }
            gutil.log("[webpack:build-dev]", stats.toString({
                colors: true
            }));
        }))
        .pipe(gulp.dest('dist/js/'));
}

//webpack bundle
function webpackBundle(done){
    var bundleConfig = Object.create(webpackConfig);
    bundleConfig.output.path = path.join(__dirname, './dist/js');
    bundleConfig.output.filename = '[name].js';
    bundleConfig.output.chunkFilename = '[id].chunk.js';
    bundleConfig.plugins = bundleConfig.plugins.concat(
        new webpack.optimize.CommonsChunkPlugin({
            name:["common"],
            filename:"[name].js",
            minChunks: Infinity
        })
    );
    bundleConfig.devtool = "sourcemap";

    var bundleCompiler = webpack(bundleConfig);
    bundleCompiler.run(function(err, stats) {
        if (err) {
            throw new gutil.PluginError("webpack:build-bundle", err);
            return;
        }
        gutil.log("[webpack:build-bundle]", stats.toString({
            colors: true
        }));
        done();
    });
}

//webpack production
function webpackPro(done) {
    var config = Object.create(webpackConfig);
    config.output.path = path.join(__dirname, './dist/js');
    config.output.filename = '[name].min.js';
    config.output.chunkFilename = '[id].chunk.min.js';
    config.plugins = config.plugins.concat(
        new webpack.optimize.CommonsChunkPlugin({
            name:["common"],
            filename:"[name].min.js",
            minChunks: Infinity
        }),
        new webpack.DefinePlugin({
            "process.env": {
                "NODE_ENV": JSON.stringify("production")
            }
        }),
        new webpack.optimize.DedupePlugin(),
        new webpack.optimize.UglifyJsPlugin({
            compress:{
                warnings:false
            },
            mangle:{
                except:['$','exports','require']
            }
        })
    );

    webpack(config, function(err, stats) {
        if(err) throw new gutil.PluginError("webpack:build", err);
        gutil.log("[webpack:production]", stats.toString({
            colors: true
        }));
        done();
    });
}

//发布任务
gulp.task("build", gulp.series(
    clean,
    gulp.parallel(copyHtml,copyJs,copyFonts,copyImg,style),
    webpackPro,
    function(done) {
        console.log('build success');
        done();
    }
));

//webpack-watch
gulp.task('webpack-watch',function(){
    webpackWatch();
});

//默认任务
gulp.task("dev", gulp.series(
    clean,
    gulp.parallel(copyHtml,copyJs,copyFonts,copyImg,style),
    webpackBundle,
    server
));
