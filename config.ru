require 'environment'
require 'rack'

if ENV['RACK_ENV'] == 'development'
  log = File.new('log/development.log', 'a')
  STDOUT.reopen(log)
  STDERR.reopen(log)
end

run Xen::API
