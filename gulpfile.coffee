gulp = require 'gulp'
coffee = require 'gulp-coffee'
clean = require 'gulp-clean'

paths =
  coffee_server: ['src/**/*.coffee', '!src/public/**/*.coffee']
  coffee_client: ['src/public/**/*.coffee']
  views: ['src/views/**/*.jade']
  build: './build'


gulp.task 'coffee_server', ->
  pipe_coffee paths.coffee_server, paths.build, bare: true

gulp.task 'coffee_client', ->
  pipe_coffee paths.coffee_client, paths.build + '/public'

gulp.task 'coffee', ['coffee_server','coffee_client']

gulp.task 'views', ->
  gulp.src paths.views
  .pipe gulp.dest paths.build+'/views'

gulp.task 'watch', ->
  gulp.watch paths.coffee_server, ['coffee_server']
  gulp.watch paths.coffee_client, ['coffee_client']
  gulp.watch paths.views, ['views']

gulp.task 'clean', ->
  gulp.src(paths.build+"/", read: false)
  .pipe(clean())

gulp.task 'default', ['coffee', 'views']


#helper functions

pipe_coffee = (source, dest, options) ->
  gulp.src source
  .pipe coffee(options)
  .pipe gulp.dest dest