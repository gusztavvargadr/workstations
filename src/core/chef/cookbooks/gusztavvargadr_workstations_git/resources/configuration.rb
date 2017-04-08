default_action :create

action :create do
  cookbook_file "#{ENV['HOME']}/.gitconfig" do
    source 'gitconfig'
    cookbook 'gusztavvargadr_workstations_git'
    action :create
  end
end
