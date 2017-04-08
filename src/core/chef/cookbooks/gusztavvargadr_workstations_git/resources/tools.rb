default_action :install

action :install do
  chocolatey_package 'git' do
    version '2.11.1'
    options '-params \'"/GitAndUnixToolsOnPath /NoShellIntegration"\''
    action :install
  end

  chocolatey_package 'gitkraken' do
    action :install
  end
end
