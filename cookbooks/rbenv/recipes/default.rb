package "autoconf"
package "bison"
package "build-essential"
package "libssl-dev"
package "libyaml-dev"
package "libreadline6"
package "libreadline6-dev"
package "zlib1g"
package "zlib1g-dev"

git "/usr/local/rbenv" do
  repository "https://github.com/sstephenson/rbenv"
  depth 1
  not_if { Dir.exists?("/usr/local/rbenv") }
end

execute "add rbenv to path" do
  command <<-CMD
    echo 'export RBENV_ROOT=/usr/local/rbenv'  >> /etc/bash.bashrc
    echo 'export PATH="$RBENV_ROOT/bin:$PATH"' >> /etc/bash.bashrc
    echo 'eval "$(rbenv init -)"'              >> /etc/bash.bashrc
  CMD
  notifies :run, "execute[reboot]", :delayed

  not_if { File.read("/etc/bash.bashrc").include?("rbenv") }
end

execute "reboot" do
  action :nothing
end

directory "/usr/local/rbenv/plugins"

git "/usr/local/rbenv/plugins/ruby-build" do
  repository "https://github.com/sstephenson/ruby-build"
  depth 1
  not_if { Dir.exists?("/usr/local/plugins/ruby-build") }
end
