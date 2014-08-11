cookbook_file "/etc/hosts" do
  only_if { File.read("/etc/hosts").include?("raspberrypi") }
end

execute "echo pi > /etc/hostname" do
  notifies :start, "service[hostname.sh]", :immediately
  only_if { File.read("/etc/hostname").include?("raspberrypi") }
end

service "hostname.sh" do
  action :nothing
end

cookbook_file "/etc/network/interfaces" do
  notifies :run, "execute[reboot]", :delayed
  not_if { File.read("/etc/network/interfaces").include?("static") }
end

execute "reboot" do
  action :nothing
end
