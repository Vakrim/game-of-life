require 'gosu'
require 'ostruct'
require 'pry'

Dir[File.dirname(__FILE__) + '/concepts/*.rb'].each {|file| require file }

module Behavior; end
Dir[File.dirname(__FILE__) + '/behaviors/*.rb'].each {|file| require file }

module Actor; end
Dir[File.dirname(__FILE__) + '/actors/*.rb'].each {|file| require file }

require './game'
