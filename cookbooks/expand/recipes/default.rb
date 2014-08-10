execute "expand root filesystem" do
  command <<-SH
    raspi-config --expand-rootfs &&
    mkdir /usr/lib/raspi-config/ &&
    touch /usr/lib/raspi-config/.expanded
  SH
  notifies :run, "execute[reboot]", :delayed

  not_if { File.exists?("/usr/lib/raspi-config/.expanded") }
end

execute "reboot" do
  action :nothing
end
