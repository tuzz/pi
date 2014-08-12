package "ntfsprogs"

directory "/media/hdd" do
  mode "0777"
end

mount "/media/hdd" do
  device "TOSHIBA"
  device_type :label
  fstype "ntfs"
  options "defaults,rw,noatime"
  action [:mount, :enable]
end
