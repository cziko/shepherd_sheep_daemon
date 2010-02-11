# This is a simple sheep_daemon
# * Prepare Readme file
# * Prepare dependencies
# * Make it work like a gem
# * Prepare config file

require 'rubygems'
gem 'sys-cpu'
gem 'sys-host'
gem 'sys-filesystem'
gem 'cziko-sys-mem'
require "sys/cpu"
require "sys/host"
require "sys/filesystem"
require "sys/mem"
include Sys
require 'net/http'
require 'uri'
require File.dirname(__FILE__) + '/../lib/sheep/filesystem_ext.rb'

loop do
  begin 
    res = Net::HTTP.post_form(URI.parse(CONFIG.server_url+"/stats.xml"), 
                              {:api_key => CONFIG.api_key, 
                               :cpu_stat => CPU.load_avg.join(","),
                               :mem_stat => [MEM.memtotal, MEM.memfree].join(","),
                               :fs_stat => [].join(",")})
    sleep (45)
  rescue
  end
end
