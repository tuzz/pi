execute "> /etc/motd" do
  not_if { File.read("/etc/motd").empty? }
end

file "/etc/profile.d/raspi-config.sh" do
  action :delete
end

execute "clean up home directories" do
  command <<-CMD
    rm -rf /root && mkdir /root &&
    rm -rf /etc/skel && mkdir /etc/skel
  CMD

  only_if { File.exists?("/root/.bashrc") }
end
