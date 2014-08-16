package "minidlna"

directory "/media/hdd/.database"

cookbook_file "/etc/minidlna.conf" do
  mode "0644"
  notifies :run, "execute[force-reload minidlna]", :immediately
end

execute "force-reload minidlna" do
  command "service minidlna force-reload"
  action :nothing
end
