#!/usr/local/bin/ruby

require 'rubygems'
require 'daemons'
require 'lib/custom_config.rb'

CONFIG = CustomConfig.new

options = {
    :app_name   => "sheep",
    :backtrace  => true,
    :log_output => true,
    :monitor    => true
  }

Daemons.run('lib/sheep_daemon.rb', options)

