cookbook_file "/home/chris/.gitconfig" do
  mode "0644"
  owner "chris"
  group "chris"
end

link "/root/.gitconfig" do
  to "/home/chris/.gitconfig"
end
