require 'pry-byebug'
require "sqlite3"

dir = File.dirname(__FILE__)
DB = SQLite3::Database.new(File.join(dir, "app/db/public_service.sqlite"))
# binding.pry
# Require all the ruby files you have created in `app`
Dir[File.join(dir, "app/**/*.rb")].each { |file| require file }

# Launch the app!
Router.new.run
