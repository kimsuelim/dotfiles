require "rubygems"

begin
  require 'hirb'
rescue LoadError
  # Missing goodies, bummer
end

if defined?(Rails) && Rails.env
  extend Rails::ConsoleMethods
end
