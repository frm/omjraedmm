if ENV["RACK_ENV"] != "production"
  require "dotenv"
  Dotenv.load
end

require "sinatra"
require "json"

$LOAD_PATH.unshift __dir__

require "active_support/all"
require "yaml"
require "httparty"

require "omjraedmm"
require "omjraedmm/scraper"
require "slack"

require "app"
