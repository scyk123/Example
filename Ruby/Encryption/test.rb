require_relative 'Encryption.rb'
require 'minitest/autorun'
Dir.glob( File.dirname(__FILE__) + '/test/**/test_*' ).each { |f| require f }