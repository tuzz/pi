remote_file "/tmp/vim.tar.gz" do
  source "https://github.com/b4winckler/vim/archive/v7-4-383.tar.gz"
  not_if { File.exists?("/tmp/vim.tar.gz") }
end

bash "extract vim" do
  user "root"
  cwd "/tmp"
  code "tar xfz vim.tar.gz"
  not_if { Dir.exists?("/tmp/vim-7-4-383") }
end

bash "install vim" do
  user "root"
  cwd "/tmp/vim-7-4-383"
  code "./configure -q --disable-gui && make -s && make -s install"
  not_if { File.exists?("/usr/local/bin/vim") }
end

git "/home/chris/.vim" do
  repository "https://github.com/tuzz/vim"
  depth 1
  enable_submodules true
  user "chris"
  group "chris"
  not_if { Dir.exists?("/home/chris/.vim") }
end

link "/home/chris/.vimrc" do
  to "/home/chris/.vim/.vimrc"
  owner "chris"
  group "chris"
end

link "/root/.vimrc" do
  to "/home/chris/.vimrc"
end

link "/root/.vim" do
  to "/home/chris/.vim"
end
