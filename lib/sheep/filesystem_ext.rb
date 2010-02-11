module FilesystemExt
  module ClassMethods
    def self.aaa
      puts "aaa"
    end
  end
  
  module InstanceMethods
    def self.aaa
      puts "aaa"
    end
  end
end

Sys::Filesystem.send :include, FilesystemExt
Sys::Filesystem.send :extend, FilesystemExt