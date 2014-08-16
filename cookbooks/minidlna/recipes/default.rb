package "minidlna"

directory "/media/hdd/.database"

cookbook_file "/etc/minidlna.conf" do
  mode "0644"
  notifies :"force-reload", "service[minidlna]", :immediately
end

service "minidlna" do
  action :nothing
end
