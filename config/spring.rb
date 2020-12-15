Spring.watch(
  ".ruby-version",
  ".rbenv-vars",
  "tmp/restart.txt",
  "tmp/caching-dev.txt"
)

%w(
  ...
  config/application.yml
).each { |path| Spring.watch(path) }