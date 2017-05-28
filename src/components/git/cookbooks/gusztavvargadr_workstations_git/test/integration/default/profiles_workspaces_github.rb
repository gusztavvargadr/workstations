repository_git_directory = '/Users/vagrant/Repos/github/gitignore/.git'

describe directory(repository_git_directory) do
  it { should exist }
end
