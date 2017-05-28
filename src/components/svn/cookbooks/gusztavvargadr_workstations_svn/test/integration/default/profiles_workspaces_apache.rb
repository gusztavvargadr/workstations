repository_svn_directory = '/Users/vagrant/Repos/apache/asf/logging/log4net/trunk/.svn'

describe directory(repository_svn_directory) do
  it { should exist }
end
