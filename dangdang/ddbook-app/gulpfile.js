const gulp = require('gulp');
const nodemon = require('gulp-nodemon');
const fileinclude = require('gulp-file-include');
//创建一个gulp任务 start
gulp.task('start', function() {
    nodemon({
        script: 'index.js',
        ext: 'js html',
        env: {
            'NODE_ENV': 'development'
        }
    })
});

gulp.task('fileinclude', function() {
    gulp.src(['./app/*.html'])
        .pipe(fileinclude({
            prefix: '@@',
            basepath: '@file'
        }))
        .pipe(gulp.dest('./views'));
});

gulp.task('default',['start','fileinclude'],function(){
  gulp.watch('./app/**/*.html', ['fileinclude']);
});
