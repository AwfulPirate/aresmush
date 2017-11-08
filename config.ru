require 'rubygems'
require 'bundler'

Bundler.require

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), 'lib'))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), 'website'))

require 'aresmush'
require 'web_server.rb'
require 'web_bootstrapper.rb'
require 'web_notifier.rb'

bootstrapper = AresMUSH::WebBootstrapper.new
bootstrapper.start

run AresMUSH::WebApp