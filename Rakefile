# Look in the tasks/setup.rb file for the various options that can be
# configured in this Rakefile. The .rake files in the tasks directory
# are where the options are used.

begin
  require 'bones'
rescue LoadError
  abort '### Please install the "bones" gem ###'
end

ensure_in_path 'lib'
# require 'sheep_daemon'
require 'custom_config'

Bones {
  name  'sheep'
  authors  'Pawel Niznik (cziko)'
  email  'niznik.pawel@gmail.com'
  url  ''
  version  CustomConfig::VERSION
  summary  'Sheep monitoring daemon'
  depend_on 'sys-cpu'
  depend_on 'sys-host'
  depend_on 'sys-filesystem'
  depend_on 'cziko-sys-mem'
  depend_on 'daemons'
}

# begin
#   require 'bones'
#   Bones.setup
# rescue LoadError
#   begin
#     load 'tasks/setup.rb'
#   rescue LoadError
#     raise RuntimeError, '### please install the "bones" gem ###'
#   end
# end
# 
# ensure_in_path 'lib'
# require 'custom_config'
# # task :default => 'spec:run'
# 
# PROJ.name = 'sheep'
# PROJ.authors = 'Pawel Niznik (cziko)'
# PROJ.email = 'niznik.pawel@gmail.com'
# PROJ.url = ''
# PROJ.summary = 'Sheep monitoring daemon'
# PROJ.version = CustomConfig::VERSION
# # PROJ.rubyforge.name = 'test'
# PROJ.exclude = %w(tmp$ bak$ ~$ CVS \.svn ^pkg ^doc)
# PROJ.exclude << '^tags$'
# 
# depend_on 'sys-cpu'
# depend_on 'sys-host'
# depend_on 'sys-filesystem'
# depend_on 'cziko-sys-mem'
# depend_on 'daemons'
# 
# PROJ.spec.opts << '--color'

# EOF
