# Include gulp
gulp = require('gulp')

#test

# Include Our Plugins
jshint = require 'gulp-jshint'
sass = require 'gulp-sass'
concat = require 'gulp-concat'
uglify = require 'gulp-uglify'
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

 # Watch Files For Changes
gulp.task 'watch', () ->
    gulp.watch 'js/*.js', ['lint', 'scripts']
    gulp.watch 'scss/*.scss', ['sass']
    return

# Default Task
gulp.task 'default', ['lint', 'sass', 'scripts', 'watch']