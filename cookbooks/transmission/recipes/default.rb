package "transmission-daemon"

directory "/media/hdd/_incomplete_"

cookbook_file "/etc/transmission-daemon/settings.json" do
  mode "0600"
  user "debian-transmission"
  group "debian-transmission"

  notifies :reload, "service[transmission-daemon]", :immediately
end

service "transmission-daemon" do
  supports :reload => true
  action :nothing
end
