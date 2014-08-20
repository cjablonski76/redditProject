# Include gulp
gulp = require('gulp')

#test

# Include Our Plugins
jshint = require 'gulp-jshint'
sass = require 'gulp-sass'
concat = require 'gulp-concat'
uglify = require 'gulp-uglify'
rename = require 'gulp-rename'
coffee = require 'gulp-coffee'
gutil = require 'gulp-util'
inject = require 'gulp-inject'
rename = require 'gulp-rename'

# Lint Task
gulp.task 'lint', () ->
    gulp.src 'js/*.js'
        .pipe jshint
        .pipe jshint.reporter 'default'

# Compile Our Sass
gulp.task 'sass', () ->
    gulp.src 'scss/*.scss'
        .pipe sass
        .pipe gulp.dest 'css'

# Concatenate & Minify JS
gulp.task 'scripts', () ->
    gulp.src 'js/*.js'
        .pipe concat 'all.js'
        .pipe gulp.dest 'dist'
        .pipe rename 'all.min.js'
        .pipe uglify
        .pipe gulp.dest 'dist'

gulp.task 'coffee', () ->
    gulp.src 'src/**/*.coffee'
        .pipe(coffee().on('error', gutil.log))
        .pipe gulp.dest 'dist'

gulp.task 'html', () ->
    gulp.src ['src/**/*.html', '!src/index.html']
        .pipe gulp.dest 'dist'

gulp.task 'index', ['coffee'], () ->
    target = gulp.src 'src/index.html'
    sources = gulp.src(['./dist/**/*.js'], {read: false});
    target.pipe inject sources, {relative: true}
        .pipe gulp.dest 'dist'


 # Watch Files For Changes
gulp.task 'watch', () ->
    gulp.watch 'js/*.js', ['lint', 'scripts']
    gulp.watch 'scss/*.scss', ['sass']
    return

# Default Task
gulp.task 'default', ['coffee', 'html', 'index']
