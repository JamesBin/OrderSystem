'use strict';

var gulp = require('gulp');
var $ = require('gulp-load-plugins')();
var browserify = require('browserify');
var transform = require('vinyl-transform');
var markJSON = require('markit-json');
var docUtil = require('amazeui-doc-util');
var browserSync = require('browser-sync');
var del = require('del');
var runSequence = require('run-sequence');
var reload = browserSync.reload;

gulp.task('clean', function(cb) {
  del('dist', cb);
});

gulp.task('copy:img', function() {
  return gulp.src('docs/img/*')
    .pipe(gulp.dest('dist/examples/img'));
});

gulp.task('copy:js', function() {
  return gulp.src('amazeui.lazyload*.js')
    .pipe(gulp.dest('dist'));
});

gulp.task('copy', ['copy:img', 'copy:js']);

gulp.task('docs', function(){
  return gulp.src(['README.md', 'docs/*.md'])
    .pipe(markJSON(docUtil.markedOptions))
    .pipe(docUtil.applyTemplate(null, {
      pluginTitle: 'Lazy Load',
      pluginDesc: '基于 jQuery 的图片懒加载插件。',
      buttons: 'amazeui/lazyload'
    }))
    .pipe($.rename(function(file) {
      file.basename = file.basename.toLowerCase();
      if (file.basename === 'readme') {
        file.basename = 'index';
      }
      file.extname = '.html';
    }))
    .pipe(gulp.dest(function(file) {
      if (file.relative === 'index.html') {
        return 'dist'
      }

      return 'dist/examples';
    }));
});

gulp.task('bundle', function() {
  var bundler = transform(function(filename) {
    var b = browserify({
      entries: filename,
      basedir: './'
    });
    return b.bundle();
  });

  gulp.src('test/main.js')
    .pipe(bundler)
    .pipe($.rename({
      basename: 'bundle'
    }))
    .pipe(gulp.dest('test'))
});

// Watch Files For Changes & Reload
gulp.task('serve', ['default'], function () {
  browserSync({
    port: 2375,
    notify: false,
    server: 'dist'
  });

  gulp.watch('dist/**/*', reload);
});

gulp.task('deploy', ['default'], function() {
  return gulp.src('dist/**/*')
    .pipe($.ghPages());
});

gulp.task('watch', function() {
  gulp.watch('docs/*.md', ['docs']);
  gulp.watch('test/main.js', ['bundle']);
});

gulp.task('default', function(cb) {
  runSequence('clean', ['copy', 'docs', 'watch'], cb);
});
