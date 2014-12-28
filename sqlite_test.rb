# sqlite_test.rb

require "sqlite3"
require "rulers/sqlite_model"

class MyTable < Rulers::Model::SQLite; end
STDERR.puts MyTable.schema.inspect

# Create row
mt = MyTable.create "title" => "I saw it!"
mt["title"] = "Yes, I  really did!"
mt.save!
mt2 = MyTable.find mt["id"]

puts "Title: #{mt2["title"]}"

top_id = mt["id"].to_i
(1..top_id).each do |id|
  mt_id = MyTable.find(id)
  puts "Found title #{mt_id["title"]}."
end

mt = MyTable.create "title" => "I saw it again!"
mt["title"] = "I really did!"
mt.save!

mt2 = MyTable.find mt["id"]

puts "Title: #{mt2["title"]}"

class Rulers::Model::SQLite
  MyTable.schema.keys.each do |key|
    define_method(key) { self[key.to_s] }
  end
end

mt2 = MyTable.find mt.id
