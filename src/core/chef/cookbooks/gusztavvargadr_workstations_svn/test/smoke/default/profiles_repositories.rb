svn_directory = '/Users/vagrant/Repos/apache/log4net/.svn'

describe directory(svn_directory) do
  it { should exist }
end
