class QuotesController < Rulers::Controller
  # attr_accessor :a_quote
  # stuff here
  def  a_quote
    "There is  no better way to waste a day" + " than messing around in a boat." + "\n\n" +
    "#{ env.each {|key, val|  puts " #{ key }:  #{ val }\n"} }" 
    # Above line will do a nice format to STDOUT
  end
  def exception
    raise "It's a bad one!"
  end

end
