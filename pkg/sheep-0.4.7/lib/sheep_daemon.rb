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
    # List of data that's going to be send to shepherd_monitoring
    api_key = CONFIG.api_key
    cpu_stat = CPU.load_avg.join(',')
    mem_stat = [MEM.memtotal, MEM.memfree].join(',')

    # Trying to send as little data as possible
    fs_stat = Filesystem.dev_mounts.inject({}) do |ary, mount|
                fs_stat = Filesystem.stat(mount)
                ary[fs_stat.path.to_s] = [fs_stat.block_size, fs_stat.blocks, fs_stat.blocks_available]
                ary
              end

    # Marshal.load(serialized_hash)
    fs_stat_serialized = Marshal.dump(fs_stat)

    data = {:api_key => api_key,
            :cpu_stat => cpu_stat,
            :mem_stat => mem_stat,
            :fs_stat => fs_stat_serialized}

    # Sending data
    res = Net::HTTP.post_form(URI.parse(CONFIG.server_url+"/stats.xml"), data)
    sleep (45)
  rescue
  end
end
