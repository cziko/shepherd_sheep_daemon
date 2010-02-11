module FilesystemExt
  module ClassMethods
    def dev_mounts_custom
      # This could be done only once i think
      mounts_file_path = '/proc/mounts'
      mounts_file = File.open(mounts_file_path, 'r')

      mounts = mounts_file.inject([]) do |ary, line|
        !line.split(' ')[0].match("/dev/").nil? ? ary << line.split(' ')[1] : ary
      end

      mounts_file.close
      mounts
    end

    # Returns only hd devices (/dev/sd*) that are mounted.
    def dev_mounts
      self.mounts.inject([]){|ary,mount| !mount.name.match("/dev/").nil? ? ary << mount : ary}
    end
  end
  
  module InstanceMethods
  end
end

Sys::Filesystem.send :extend, FilesystemExt::ClassMethods
Sys::Filesystem.send :include, FilesystemExt::InstanceMethods
