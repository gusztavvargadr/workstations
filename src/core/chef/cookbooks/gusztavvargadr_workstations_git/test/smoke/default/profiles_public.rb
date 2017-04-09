git_directory = '/Users/vagrant/Repos/github/gitignore/.git'

describe directory(git_directory) do
  it { should exist }
end
