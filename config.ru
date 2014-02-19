require './config/application'
run 'BestQuotes::Application.new'
run proc { [200, {"Content-Type" => "text/html"}, [ "Hello World" ]] }
# run proc { [200, {"Content-Type" => "text/html"}, [ "Hello World" ]] }
