# Workstations

**Quick links** [Vagrant boxes] | [Packer templates]  

This repository contains Windows-based workstations for .NET, SQL Server and infrastructure development and default OS installations using Vagrant with Hyper-V / VirtualBox and Chef.

**Contents** [Overview] | [Getting started] | [Usage] | [Contributing] | [Resources]  

## Overview

This repository contains Windows-based workstations for the following scenarios:

- [.NET development] with Visual Studio 2017, 2015 and 2010.
- [SQL Server development] with SQL Server Management Studio 2016 and SQL Server 2014.
- [Infrastructure development] with Chef, Packer and Terraform using Docker, VirtualBox and AWS.
- Default [OS installations] for generic experiments with Windows Server 2016 and Windows 10.

All of them support an easy, source-controlled way of installing and configuring the most common development tools for the related stacks, and the management of the source code of your projects, based on [Vagrant] with [Hyper-V] / [VirtualBox] and [Chef]:

- Managing the core [OS][ComponentsOS] settings, installing features and custom packages.
- Working with [Git][ComponentsGit] and [SVN][ComponentsSVN] repositories.
- Managing [NuGet][ComponentsNuGet] sources.
- Downloading [Vagrant][ComponentsVagrant] boxes and pulling [Docker][ComponentsDocker] images.
- Setting up [AWS][ComponentsAWS] profiles.

This way you can easily create the same workstations anytime, anywhere, and instead of writing extensive documentation, you can simply share the ready to use environments with your teammates and contributors. Of course, you can extend the above options freely with any of your own configuration and provisioning steps.

[Overview]: #overview

## Getting started

**Note** This section assumes you are familiar with the basics of Vagrant. If that's not the case, it's recommended that you take a quick look at its [getting started guide][VagrantGettingStarted].  

**Note** The workstations have been tested on Windows hosts only, but they are supposed to run on any other platform as well, given that the actual virtualization provider (e.g. VirtualBox) supports it. [Let me know][Contributing] if you encounter any issues and I'm glad to help.  

**Note** Booting a workstation for the first time can take a significant amount of time. If you have a slow connection, downloading the [Vagrant boxes] - usually several GBs for Windows guests - might require some patience and retries. Creating another machine from the same box later though will reuse the already downloaded one of course.  

**Note** Configuring the core OS after Sysprep (to support actually unique virtual machines) and provisioning the workstations (e.g. installing the custom tools not included in the [original boxes][Packer templates]) by default happens during the initial boot as well. However, starting the machines again later will not need these steps, so the process will be significantly faster.  

[Getting started]: #getting-started

[VagrantGettingStarted]: https://www.vagrantup.com/intro/getting-started/index.html
[Vagrant boxes]: https://atlas.hashicorp.com/gusztavvargadr
[Packer templates]: https://github.com/gusztavvargadr/packer

### Installing the tools

Follow the steps below to install the required tools:

1. Install [Vagrant][VagrantInstallation].
1. Install the [Chef Development Kit][ChefDKInstallation].
1. Install the following plugins:
    1. [vagrant-reload][VagrantReloadInstallation].
    1. [vagrant-berkshelf][VagrantBerkshelfInstallation].
1. Install the tools for the virtualization provider you want to use.

[VagrantInstallation]: https://www.vagrantup.com/docs/installation/
[ChefDKInstallation]: https://downloads.chef.io/chef-dk/
[VagrantReloadInstallation]: https://github.com/aidanns/vagrant-reload#installation
[VagrantBerkshelfInstallation]: https://github.com/berkshelf/vagrant-berkshelf#installation

[VagrantEnvDefaultProvider]: https://www.vagrantup.com/docs/other/environmental-variables.html#vagrant_default_provider

#### Using Hyper-V

**Note** Other virtualization providers that you might use will not work when Hyper-V is enabled. See [Hanselman's post][HyperVSwitching] for switching between them easily.  

1. Enable [Hyper-V][HyperVEnabling]. You will need Windows 10 or Windows Server 2016 version 1607 or later on the host.
1. Optionally, if you plan to use Hyper-V by default, add the [environment variable][VagrantEnvDefaultProvider] `VAGRANT_DEFAULT_PROVIDER` with the value of `hyperv`.
1. Create a [virtual switch][HyperVVirtualSwitchCreating] to be used with Vagrant with access to the external network. Optionally, Add the [environment variable][VagrantCoreNetworkingBridge] `VAGRANT_NETWORK_BRIDGE` with the value of the name of the virtual switch you've created to prevent Vagrant from asking for it every time a machine gets [created][VagrantVNetworkingHyper].
1. Optionally, add the [environment variables][VagrantCoreSyncedFoldersSMB] `VAGRANT_SMB_USERNAME` and `VAGRANT_SMB_PASSWORD` with your credentials on the host to prevent Vagrant from asking it every time a machine gets [booted][VagrantSyncedFoldersSMB].

[HyperVSwitching]: http://www.hanselman.com/blog/SwitchEasilyBetweenVirtualBoxAndHyperVWithABCDEditBootEntryInWindows81.aspx
[HyperVEnabling]: https://docs.microsoft.com/en-us/virtualization/hyper-v-on-windows/quick-start/enable-hyper-v
[HyperVVirtualSwitchCreating]: https://docs.microsoft.com/en-us/virtualization/hyper-v-on-windows/quick-start/connect-to-network
[VagrantCoreNetworkingBridge]: src/Vagrantfile.core.rb#L21
[VagrantNetworkingHyperV]: https://www.vagrantup.com/docs/hyperv/limitations.html#limited-networking
[VagrantSyncedFoldersSMB]: https://www.vagrantup.com/docs/synced-folders/smb.html#options
[VagrantCoreSyncedFoldersSMB]: src/Vagrantfile.core.rb#L22

#### Using VirtualBox

1. Install [VirtualBox][VirtualBoxInstallation]. It is recommended to have VirtualBox version 5.1.22 or later on the host.
1. Optionally, if you plan to use VirtualBox by default, add the [environment variable][VagrantEnvDefaultProvider] `VAGRANT_DEFAULT_PROVIDER` with the value of `virtualbox`.

[VirtualBoxInstallation]: https://www.virtualbox.org/wiki/Downloads

### Creating the first workstation

**Note** The sample in this section creates a workstation with some minimal configuration by default, focusing on demonstrating the management of machines in general. You will see the details of how to customize it according to your preferences [later][Usage].

You are now ready to create a workstation with Vagrant.

Clone this repository and navigate to the root directory of the clone using your shell. Then, enter the directory of your personal environment to list the available machines:

```sh
clone$ cd src/people/me
clone/src/people/me$ vagrant status
```

The output will be something similar to this:

```
dotnet                    not_created (hyperv)
sql                       not_created (hyperv)
infrastructure            not_created (hyperv)
os                        not_created (hyperv)
```

Then, for example, to create a .NET workstation, simply invoke `vagrant up`:

```sh
clone/src/people/me$ vagrant up dotnet
```

Now, it's time to be patient. The box - in this case, by default with [Visual Studio 2017 Community][w16s-vs17c] including [Windows Server 2016 Standard][w16s] - will be downloaded and the machine will be provisioned before the first use. If this is not the configuration that you want, you can terminate the process anytime with Ctrl-C.

Once the machine is ready, you can connect to it with RDP or open a remote PowerShell shell:

```sh
clone/src/people/me$ vagrant rdp dotnet
clone/src/people/me$ vagrant powershell dotnet
``` 

Later, you can check the status of your machines by typing `vagrant status` again in the same directory or `vagrant global-status` anywhere to list all the machines on your host.

```sh
clone/src/people/me$ vagrant status
dotnet                    running (hyperv)
sql                       not_created (hyperv)
infrastructure            not_created (hyperv)
os                        not_created (hyperv)
```

```sh
$ vagrant global-status
id  dotnet hyperv running    clone/src/people/me
```

When you've finished with your work, you can shut down the machine with `vagrant halt`. This will persist the machine's state, so next time when you invoke `vagrant up`, it will boot much more faster than for the first time, and your files and settings will be preserved.

```sh
clone/src/people/me$ vagrant halt dotnet
```

If you no longer need a machine, you can destroy it. As expected, this will wipe it completely from your system (on the next `vagrant up`, it will be provisioned again from scratch):

```sh
clone/src/people/me$ vagrant destroy dotnet
```

The box will remain on your system after destroying the machine as `vagrant box list` reports it, as other machines might still use it. You can use `vagrant box remove` to clean it up if you no longer need it.

## Usage

**Note** At this point you might want to [fork this repository][Fork] and create your own branch to save your changes so you can [compare your workstations][Compare] easily with others.

Take a moment to realize that this might have been the last time you installed something for your workstations manually.

[Usage]: #usage

[Fork]: https://help.github.com/articles/fork-a-repo/
[Compare]: https://github.com/gusztavvargadr/workstations/compare/people/gusztavvargadr

### Basics

This repository uses custom [Vagrant extensions][VagrantCore] to enable creating and reusing dynamic configurations based on [YAML] and [ERB] for the most common machine parameters and provisioning options.

[YAML]: https://en.wikipedia.org/wiki/YAML
[ERB]: http://www.stuartellis.name/articles/erb/

#### Configuration

For example, you can define some [reasonable defaults][ComponentsCoreYaml] to be applied to every configuration:

```yml
# src/components/core/vagrant.yml
core:
  box: w16s
  provider:
    memory: 4096
    cpus: 2
```

This means that by default the machines will use the [Windows Server 2016 Standard][w16s] box and they will be allocated 4 GB of RAM and 2 virtual CPUs.

Also, you can define how various components, for example, the core [OS][ComponentsOSYaml] is being provisioned:

```yml
# src/components/os/vagrant.yml
core:
  chef:
    cookbooks:
      - gusztavvargadr_workstations_os
```

This means that the custom [OS cookbook][ComponentsOSCookbook] will be used for provisioning.

<!--
TODO: attributes, stacks, projects, people
-->

#### Provisioning

Even if being run in a VM with Hyper-V or VirtualBox, Windows still loves to be restarted, and this is especially the case during provisioning, when e.g. Windows Features or specific tools get installed. To support those scenarios when provisioning would require the use of another component which just got installed, but it requires a restart, all the custom cookbooks support being executed in different stages, and the custom Vagrant extension will [reboot the machine][VagrantCore] between them.

In the `requirements` stage core settings like Windows Features and environment variables get installed and configured.

After those are set up correctly, the `tools` stage is used to install e.g. Chocolatey packages or applications with native installers.

Finally, in the `profiles` stage all the tools can now be used properly, for example, to clone Git repositories or manage NuGet sources.

[VagrantCore]: src/Vagrantfile.core.rb

<!--
todo: download optimization and / or build own
-->

<!--
multi machine
options

Besides the above, you can of course add any of your own customizations using the tools [Vagrant supports][VagrantProvisioning].

[VagrantProvisioning]: https://www.vagrantup.com/docs/provisioning/
-->

### Components

#### Core

[ComponentsCoreYaml]: src/components/core/vagrant.yml
[ComponentsCoreCookbook]: src/components/os/cookbooks/gusztavvargadr_workstations_core
[ComponentsOSSamples]: src/components/os/cookbooks/gusztavvargadr_workstations_core/.kitchen.yml

#### OS

<!--
  * Configuring locales, time zone and environment variables.
  * Installing OS features.
  * Installing Chocolatey and native packages.
-->

[Samples][ComponentsOSSamples]

[ComponentsOS]: #os

[ComponentsOSYaml]: src/components/os/vagrant.yml
[ComponentsOSCookbook]: src/components/os/cookbooks/gusztavvargadr_workstations_os
[ComponentsOSSamples]: src/components/os/cookbooks/gusztavvargadr_workstations_os/.kitchen.yml#L26-L33

#### Git

<!--
  * Installing the core Git tools.
  * Configuring Git settings.
  * Cloning public and private repositories.
-->

[Samples][ComponentsGitSamples]

[ComponentsGit]: #git

[ComponentsGitYaml]: src/components/git/vagrant.yml
[ComponentsGitCookbook]: src/components/git/cookbooks/gusztavvargadr_workstations_git
[ComponentsGitSamples]: src/components/git/cookbooks/gusztavvargadr_workstations_git/.kitchen.yml

#### SVN

<!--
* SVN
  * Installing the core SVN tools.
  * Checking out public and private repositories.
-->

[Samples][ComponentsSVNSamples]

[ComponentsSVN]: #svn

[ComponentsSVNYaml]: src/components/svn/vagrant.yml
[ComponentsSVNCookbook]: src/components/svn/cookbooks/gusztavvargadr_workstations_svn
[ComponentsSVNSamples]: src/components/svn/cookbooks/gusztavvargadr_workstations_svn/.kitchen.yml

#### NuGet

<!--
* NuGet
  * Installing the core NuGet tools.
  * Adding public and private package sources.
-->

[Samples][ComponentsNuGetSamples]

[ComponentsNuGet]: #nuget

[ComponentsNuGetYaml]: src/components/nuget/vagrant.yml
[ComponentsNuGetCookbook]: src/components/nuget/cookbooks/gusztavvargadr_workstations_nuget
[ComponentsNuGetSamples]: src/components/nuget/cookbooks/gusztavvargadr_workstations_nuget/.kitchen.yml

#### Vagrant

<!--
* Vagrant
  * Installing Vagrant itself and its plugins.
  * Adding boxes.
-->

[Samples][ComponentsVagrantSamples]

[ComponentsVagrant]: #vagrant

[ComponentsVagrantYaml]: src/components/vagrant/vagrant.yml
[ComponentsVagrantCookbook]: src/components/vagrant/cookbooks/gusztavvargadr_workstations_vagrant
[ComponentsVagrantSamples]: src/components/vagrant/cookbooks/gusztavvargadr_workstations_vagrant/.kitchen.yml

#### Docker

<!--
* Docker
  * Installing the core Docker tools.
  * Pulling images.
-->

[Samples][ComponentsDockerSamples]

[ComponentsDocker]: #docker

[ComponentsDockerYaml]: src/components/dockere/vagrant.yml
[ComponentsDockerCookbook]: src/components/dockere/cookbooks/gusztavvargadr_workstations_dockere
[ComponentsDockerSamples]: src/components/dockere/cookbooks/gusztavvargadr_workstations_dockere/.kitchen.yml

#### AWS

<!--
* AWS
  * Installing the core AWS tools.
  * Setting up AWS CLI profiles.
-->

[Samples][ComponentsAWSSamples]

[ComponentsAWS]: #aws

[ComponentsAWSYaml]: src/components/aws/vagrant.yml
[ComponentsAWSCookbook]: src/components/dockere/cookbooks/gusztavvargadr_workstations_dockere
[ComponentsAWSSamples]: src/components/dockere/cookbooks/gusztavvargadr_workstations_dockere/.kitchen.yml

### Stacks

#### .NET development

Boot the workstation:

```sh
$ cd src/stacks/dotnet
$ vagrant up (vs10p|vs15c|vs15p|vs17c|vs17p)
```

The workstation is created by default with the following tools installed and configured:

* [Windows Server 2016 Standard][w16s]
  * **vs10p** - [Visual Studio 2010 Professional][w16s-vs10p]
  * **vs15c** - [Visual Studio 2015 Community][w16s-vs15c]
  * vs15p - [Visual Studio 2015 Professional][w16s-vs15p]
  * vs17c - [Visual Studio 2017 Community][w16s-vs17c]
  * vs17p - [Visual Studio 2017 Professional][w16s-vs17p]
* [OS]
* [Git]
* [NuGet]

[.NET development]: #net-development

[w16s]: https://atlas.hashicorp.com/gusztavvargadr/boxes/w16s
[w16s-vs10p]: https://atlas.hashicorp.com/gusztavvargadr/boxes/w16s-vs10p
[w16s-vs15c]: https://atlas.hashicorp.com/gusztavvargadr/boxes/w16s-vs15c
[w16s-vs15p]: https://atlas.hashicorp.com/gusztavvargadr/boxes/w16s-vs15p
[w16s-vs17c]: https://atlas.hashicorp.com/gusztavvargadr/boxes/w16s-vs17c
[w16s-vs17p]: https://atlas.hashicorp.com/gusztavvargadr/boxes/w16s-vs17p

#### SQL Server development

Boot the workstation:

```sh
$ cd src/stacks/sql
$ vagrant up (sql14d|ssms16)
```

The workstation is created by default with the following tools installed and configured:

* [Windows Server 2016 Standard][w16s]
  * sql14d - [SQL Server 2014 Developer][w16s-sql14d]
  * ssms16 - SQL Server Management Studio 16
* [OS]
* [Git]

[SQL Server development]: #sql-server-development

[w16s-sql14d]: https://atlas.hashicorp.com/gusztavvargadr/boxes/w16s-sql14d

#### Infrastructure development

Boot the workstation:

```sh
$ cd src/stacks/infrastructure
$ vagrant up (aws|dockerc|dockere|virtualbox)
```

The workstation is created by default with the following tools installed and configured:

* [Windows Server 2016 Standard][w16s]
  * aws - [AWS] command line tools
  * dockerc - Docker Community Edition (Edge)
  * dockere - Docker Enterprise Edition
  * virtualbox - VirtualBox
* [OS]
* [Git]
* [Chef], [Packer], [Terraform]
* [Vagrant]

[Infrastructure development]: #infrastructure-development
[Packer]: https://chocolatey.org/packages/packer
[Terraform]: https://chocolatey.org/packages/terraform

#### OS installations

[OS installations]: #os-installations

### Projects

### People

## Contributing

<!--
**Note** This section assumes you are familiar with the basics of [Chef]. If that's not the case, it's recommended that you take a quick look at its [getting started guide][ChefGettingStarted].  

[ChefGettingStarted]: https://learn.chef.io/tutorials/
-->

Any feedback, [issues] and / or [pull requests] are welcome and greatly appreciated.

[Contributing]: #contributing

[Issues]: https://github.com/gusztavvargadr/workstations/issues
[Pull requests]: https://github.com/gusztavvargadr/workstations/pulls

## Resources

* [Vagrant]
* [Hyper-V]
* [VirtualBox]
* [Chef]

[Resources]: #resources

[Vagrant]: https://www.vagrantup.com/
[Hyper-V]: https://en.wikipedia.org/wiki/Hyper-V
[VirtualBox]: https://www.virtualbox.org/
[Chef]: https://www.chef.io/chef/
