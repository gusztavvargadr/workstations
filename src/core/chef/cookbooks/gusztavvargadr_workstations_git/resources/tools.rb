default_action :install

action :install do
  chocolatey_package 'git' do
    version '2.11.1'
    options '-params \'"/GitAndUnixToolsOnPath"\''
    action :install
  end

  cookbook_file "#{ENV['HOME']}/.gitconfig" do
    source 'gitconfig'
    cookbook 'gusztavvargadr_workstations_git'
    action :create
  end
end
