user "chris" do
  supports manage_home: true
  home "/home/chris"
end

execute "unlock user" do
  command "usermod -p '*' chris"
  only_if { `cat /etc/shadow | grep chris`.include?("!") }
end

group "sudo" do
  action :modify
  append true
  members "chris"
end

cookbook_file "/etc/sudoers" do
  mode "0440"
end

directory "/home/chris/.ssh" do
  mode "0700"
  owner "chris"
  group "chris"
end

cookbook_file "/home/chris/.ssh/authorized_keys" do
  source "id_rsa.pub"
  mode "0644"
  owner "chris"
  group "chris"
end

cookbook_file "/etc/ssh/sshd_config" do
  mode "0644"
  notifies :restart, "service[ssh]", :immediately
end

service "ssh" do
  action :nothing
end
