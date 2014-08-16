execute "configure git" do
  command <<-CMD
    git config --global user.name "Chris Patuzzo"
    git config --global user.email chris@patuzzo.co.uk
    git config --global color.ui true
    git config --global core.editor vim
  CMD

  not_if { `git config --global user.email`.include?("chris") }
end
