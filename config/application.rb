# best_quotes/config/application.rb
$LOAD_PATH << File.join(File.dirname(__FILE__),  '..',  '..', 'rulers', 'lib')
$LOAD_PATH << File.join(File.dirname(__FILE__),  '..',  'app', 'controllers')

require 'pry'
require 'rulers'

module BestQuotes
  class Application < Rulers::Application
  end
end
