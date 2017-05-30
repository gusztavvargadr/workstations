# Workstations

<!--
samples: add output for provisining
kitchen samples - multiple instances where available
-->

**Quick links** [Vagrant boxes] | [Packer templates] | [Vagrant resources]  

This repository contains Windows-based virtual workstations for .NET, SQL and infrastructure development using Vagrant with Hyper-V and VirtualBox.

[Vagrant resources]: https://github.com/gusztavvargadr/vagrant

**Contents** [Overview] | [Getting started] | [Usage] | [Contributing] | [Resources]  

## Overview

This repository contains Windows-based virtual workstations for the following scenarios:

- [.NET development][StacksDotnet] with Visual Studio 2017, 2015 and 2010.
- [SQL development][StacksSQL] with SQL Server Management Studio 17 and SQL Server 2014.
- [Infrastructure development][StacksInfrastructure] with Vagrant using Docker, VirtualBox and AWS.

All of them support an easy, source-controlled way of installing and configuring the most common development tools for the related stacks, and the management of the source code of your projects, based on [Vagrant] with [Hyper-V] / [VirtualBox] and [Chef]:

- Installing [core][ComponentsCore] features, packages and managing [OS][ComponentsOS] settings.
- Using different versions of [Visual Studio][ComponentsVisualStudio] and [SQL Server][ComponentsSQLServer].
- Managing [Vagrant][ComponentsVagrant] plugins and downloading boxes.
- Pulling [Docker][ComponentsDocker] images.
- Configuring [AWS][ComponentsAWS] profiles.
- Working with [Git][ComponentsGit] and [SVN][ComponentsSVN] repositories.
- Managing [NuGet][ComponentsNuGet] sources.

This way you can easily create the same workstations anytime, anywhere, and instead of writing extensive documentation, you can simply share the ready to use environments with your teammates and contributors. Of course, you can extend the above options freely with any of your own configuration and provisioning steps.

[Overview]: #overview

## Getting started

**In this section** [Installing the tools] | [Creating your first workstation]  

**Note** This section assumes you are familiar with the basics of Vagrant. If that's not the case, it's recommended that you take a quick look at its [getting started guide][VagrantGettingStarted].  

**Note** The workstations have been tested on Windows hosts only, but they are supposed to run on any other platform as well, given that the actual virtualization provider (e.g. VirtualBox) supports it. [Let me know][Contributing] if you encounter any issues and I'm glad to help.  

[Getting started]: #getting-started

[VagrantGettingStarted]: https://www.vagrantup.com/intro/getting-started/index.html

### Installing the tools

**In this section** [Using Hyper-V] | [Using VirtualBox]  

Follow the steps below to install the required tools:

1. Install [Vagrant][VagrantInstallation].
1. Install the [Chef Development Kit][ChefDKInstallation].
1. Install the following plugins:
    1. [vagrant-reload][VagrantReloadInstallation].
    1. [vagrant-berkshelf][VagrantBerkshelfInstallation].
1. Install the tools for the virtualization provider you want to use.

[Installing the tools]: #installing-the-tools

[VagrantInstallation]: https://www.vagrantup.com/docs/installation/
[ChefDKInstallation]: https://downloads.chef.io/chef-dk/
[VagrantReloadInstallation]: https://github.com/aidanns/vagrant-reload#installation
[VagrantBerkshelfInstallation]: https://github.com/berkshelf/vagrant-berkshelf#installation

[VagrantEnvDefaultProvider]: https://www.vagrantup.com/docs/other/environmental-variables.html#vagrant_default_provider
[VagrantCliUpProvider]: https://www.vagrantup.com/docs/cli/up.html#provider-x

#### Using Hyper-V

**Note** Other virtualization providers that you might use will not work when Hyper-V is enabled. See [Hanselman's post][HyperVSwitching] for switching between them easily.  

1. Enable [Hyper-V][HyperVEnabling]. You will need Windows 10 or Windows Server 2016 version 1607 or later on the host.
    - Optionally, if you plan to use Hyper-V by default, add the [environment variable][VagrantEnvDefaultProvider] `VAGRANT_DEFAULT_PROVIDER` with the value of `hyperv` to prevent specifying it every time a machine is [booted][VagrantCliUpProvider].
    - Optionally, add the [environment variable][VagrantCoreHyperVLinkedClone] `VAGRANT_LINKED_CLONE` to save some disk space using [differencing disks][VagrantHyperVDifferencingDisks].
    - Optionally, add the [environment variables][VagrantCoreSyncedFoldersSMB] `VAGRANT_SMB_USERNAME` and `VAGRANT_SMB_PASSWORD` with your credentials on the host to prevent Vagrant from asking it every time a machine is [booted][VagrantSyncedFoldersSMB].
1. Create a [virtual switch][HyperVVirtualSwitchCreating] to be used with Vagrant with access to the external network.
    - Optionally, add the [environment variable][VagrantCoreHyperVNetworkingBridge] `VAGRANT_NETWORK_BRIDGE` with the value of the name of the virtual switch you've created to prevent Vagrant from asking for it every time a machine is [created][VagrantHyperVNetworking].

[Using Hyper-V]: #using-hyper-v

[HyperVSwitching]: http://www.hanselman.com/blog/SwitchEasilyBetweenVirtualBoxAndHyperVWithABCDEditBootEntryInWindows81.aspx
[HyperVEnabling]: https://docs.microsoft.com/en-us/virtualization/hyper-v-on-windows/quick-start/enable-hyper-v
[VagrantCoreHyperVLinkedClone]: src/Vagrantfile.core.rb#L22
[VagrantHyperVDifferencingDisks]: https://www.vagrantup.com/docs/hyperv/configuration.html#differencing_disk
[VagrantCoreSyncedFoldersSMB]: src/Vagrantfile.core.rb#L24
[VagrantSyncedFoldersSMB]: https://www.vagrantup.com/docs/synced-folders/smb.html#options
[HyperVVirtualSwitchCreating]: https://docs.microsoft.com/en-us/virtualization/hyper-v-on-windows/quick-start/connect-to-network
[VagrantCoreHyperVNetworkingBridge]: src/Vagrantfile.core.rb#L23
[VagrantHyperVNetworking]: https://www.vagrantup.com/docs/hyperv/limitations.html#limited-networking

#### Using VirtualBox

1. Install [VirtualBox][VirtualBoxInstallation]. It is recommended to have VirtualBox version 5.1.22 or later on the host.
    - Optionally, if you plan to use VirtualBox by default, add the [environment variable][VagrantEnvDefaultProvider] `VAGRANT_DEFAULT_PROVIDER` with the value of `virtualbox` to prevent specifying it every time a machine is [booted][VagrantCliUpProvider].
    - Optionally, add the [environment variable][VagrantCoreVirtualBoxLinkedClone] `VAGRANT_LINKED_CLONE` to save some disk space using [linked clones][VagrantVirtualBoxLinkedClone].

[Using Hyper-V]: #using-virtualbox

[VirtualBoxInstallation]: https://www.virtualbox.org/wiki/Downloads
[VagrantCoreVirtualBoxLinkedClone]: src/Vagrantfile.core.rb#L30
[VagrantVirtualBoxLinkedClone]: https://www.vagrantup.com/docs/virtualbox/configuration.html#linked-clones

### Creating your first workstation

**Note** Booting a workstation for the first time can take a significant amount of time. If you have a slow connection, downloading the [Vagrant boxes] - usually several GBs for Windows guests - might require some patience and retries. Creating another machine from the same box later though will reuse the already downloaded one of course.  

**Note** Configuring the core OS after Sysprep (to support actually unique virtual machines) and provisioning the workstations (e.g. installing the custom tools not included in the [original boxes][Packer templates]) by default happens during the initial boot as well. However, starting the machines again later will not need these steps, so the process will be significantly faster.  

**Note** The example in this section creates a workstation with a sample configuration by default, focusing on demonstrating the management of machines in general. You will see the details of how to customize it according to your preferences [later][Usage].

You are now ready to create your workstations with Vagrant.

Clone this repository and navigate to the root directory of the clone using your shell. Then, enter the directory of your personal environment to list the available machines:

```sh
clone$ cd src/people/me
clone/src/people/me$ vagrant status
```

The output will be something similar to this:

```
work                      not_created (hyperv)
playground                not_created (hyperv)
private                   not_created (hyperv)
```

Then, for example, to create the `playground` workstation, simply invoke `vagrant up`:

```sh
clone/src/people/me$ vagrant up playground
```

Now, it's time to be patient. The box - in this case, by default with [Visual Studio 2017 Community][w16s-vs17c] including [Windows Server 2016 Standard][w16s] - will be downloaded and the machine will be provisioned before the first use to include all the components this repository supports. If this is not the configuration that you want, you can terminate the process anytime.

Once the machine is ready, you can connect to it with RDP or open a remote PowerShell shell using the default credentials, `vagrant` for both the user name and password:

```sh
clone/src/people/me$ vagrant rdp playground
clone/src/people/me$ vagrant powershell playground
``` 

Later, you can check the status of your machines by typing `vagrant status` again in the same directory or `vagrant global-status` anywhere to list all the machines on your host.

```sh
clone/src/people/me$ vagrant status
work                      not_created (hyperv)
playground                running (hyperv)
private                   not_created (hyperv)
```

```sh
$ vagrant global-status
id  playground hyperv running    clone/src/people/me
```

When you've finished with your work, you can shut down the machine with `vagrant halt`. This will persist the machine's state, so next time when you invoke `vagrant up`, it will boot much more faster than for the first time, and your files and settings will be preserved.

```sh
clone/src/people/me$ vagrant halt playground
```

If you no longer need a machine, you can destroy it. As expected, this will wipe it completely from your system (on the next `vagrant up`, it will be provisioned again from scratch):

```sh
clone/src/people/me$ vagrant destroy playground
```

The box will remain on your system after destroying the machine as `vagrant box list` reports it, as other machines might still use it. You can use `vagrant box remove` to clean it up if you no longer need it.

[Creating your first workstation]: #creating-your-first-workstation

[Vagrant boxes]: https://atlas.hashicorp.com/gusztavvargadr
[Packer templates]: https://github.com/gusztavvargadr/packer

## Usage

**In this section** [Basics] | [Components] | [Stacks] | [Projects] | [People]  

**Note** At this point you might want to [fork this repository][Fork] and create your own branch to save your changes so you can [compare your workstations][Compare] easily with others.

Take a moment to realize that this might have been the last time you installed something for your workstations manually.

[Usage]: #usage

[Fork]: https://help.github.com/articles/fork-a-repo/
[Compare]: https://github.com/gusztavvargadr/workstations/compare/people/gusztavvargadr

### Basics

**In this section** [Configuration] | [Provisioning]  

This repository uses custom [Vagrant extensions][VagrantCore] to enable creating and reusing dynamic configurations based on [YAML] and [ERB] for the most common machine parameters and provisioning options.

[Basics]: #basics

[VagrantCore]: src/Vagrantfile.core.rb
[YAML]: https://en.wikipedia.org/wiki/YAML
[ERB]: http://www.stuartellis.name/articles/erb/

#### Configuration

For example, you can define some [reasonable defaults][ComponentsCoreYaml] to be applied to every configuration:

```yml
# src/components/core/vagrant.yml
core:
  provider:
    memory: 4096
    cpus: 2
```

This means that by default the machines will allocate 4 GB RAM and 2 virtual CPUs.

Also, you can define how various components, like the core [OS][ComponentsOSYaml] is being provisioned:

```yml
# src/components/os/vagrant.yml
core:
  chef:
    cookbooks:
      - gusztavvargadr_workstations_os
    json:
      gusztavvargadr_workstations_os:
        requirements:
          locales:
            system: en-US
            ui: en-US
            user: en-US
          datetime:
            timezone: UTC
```

This means that the custom [OS cookbook][ComponentsOSCookbook] will be used for provisioning, and the specified values, in this case, `en-US` for all the locales and `UTC` for the timezone will be set. The cookbooks provide [detailed samples][ComponentsOSSamples] for the scenarios they support.

You can also define further parameters for Vagrant, in this case, a base box specifying the [Visual Studio][ComponentsVisualStudioYaml] version being used:

```yml
# src/components/vs/vagrant.yml
core:
  includes:
    - components/core/core

17c:
  includes:
    - components/vs/core
  box: w16s-vs17c
```

In this case the configuration named `components/vs/17c` will use the [Visual Studio 2017 Community][w16s-vs17c] box. This options is very useful for tools which take significant time to install, so instead of applying them on the first boot, they can be already included in the [Vagrant boxes].

You can also see how the existing configuration is being reused. For `components/vs/core` the above `components/core/core` part (specifying the memory and the CPU settings) is being included as a new baseline, as `components/vs/17c` includes `components/vs/core` in turn. As the list notation suggests, you can include any number or other components. If you specify a single value which exists in the included part (like the box), it will be overridden, while collections (for example, the list of cookbooks) will be merged.

<!--
TODO: stacks, projects, people
-->

[Configuration]: #configuration

#### Provisioning

Even if being run in a VM with Hyper-V or VirtualBox, Windows still loves to be restarted, and this is especially the case during provisioning, when e.g. Windows Features or specific tools get installed. To support those scenarios when provisioning would require the use of another component which just got installed, but it requires a restart, all the custom cookbooks support being executed in different stages, and the custom Vagrant extension will [restart the machine][VagrantCoreRestart] between them.

In the `requirements` stage core settings like Windows Features and environment variables get installed and configured.

After those have been set up correctly, the `tools` stage is used to install e.g. Chocolatey packages or applications with native installers.

Finally, in the `profiles` stage all the tools can now be used properly, for example, to clone Git repositories or manage NuGet sources.

[Provisioning]: #provisioning

[VagrantCoreRestart]: src/Vagrantfile.core.rb#L37

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

**In this section** [Core][ComponentsCore] | [OS][ComponentsOS] | [Visual Studio][ComponentsVisualStudio] | [SQL Server][ComponentsSQLServer] | [Vagrant][ComponentsVagrant] | [Docker][ComponentsDocker] | [AWS][ComponentsAWS] | [Git][ComponentsGit] | [SVN][ComponentsSVN] | [NuGet][ComponentsNuGet]  

[Components]: #components

#### Core

[Samples][ComponentsCoreSamples]

[ComponentsCore]: #core

[ComponentsCoreYaml]: src/components/core/vagrant.yml
[ComponentsCoreSamples]: src/components/core/cookbooks/gusztavvargadr_workstations_core/.kitchen.yml#L25
[ComponentsCoreCookbook]: src/components/core/cookbooks/gusztavvargadr_workstations_core

#### OS

- w10e - [Windows 10 Enterprise][w10e]
- w16s - [Windows Server 2016 Standard][w16s]

[Samples][ComponentsOSSamples]

[ComponentsOS]: #os

[w10e]: https://atlas.hashicorp.com/gusztavvargadr/boxes/w10e
[w16s]: https://atlas.hashicorp.com/gusztavvargadr/boxes/w16s

[ComponentsOSYaml]: src/components/os/vagrant.yml
[ComponentsOSSamples]: src/components/os/cookbooks/gusztavvargadr_workstations_os/.kitchen.yml#L26
[ComponentsOSCookbook]: src/components/os/cookbooks/gusztavvargadr_workstations_os

#### Visual Studio

- vs10p - [Visual Studio 2010 Professional][w16s-vs10p]
- vs15c - [Visual Studio 2015 Community][w16s-vs15c]
- vs15p - [Visual Studio 2015 Professional][w16s-vs15p]
- vs17c - [Visual Studio 2017 Community][w16s-vs17c]
- vs17p - [Visual Studio 2017 Professional][w16s-vs17p]

[Samples][ComponentsVisualStudioSamples]

[ComponentsVisualStudio]: #visual-studio

[w16s-vs10p]: https://atlas.hashicorp.com/gusztavvargadr/boxes/w16s-vs10p
[w16s-vs15c]: https://atlas.hashicorp.com/gusztavvargadr/boxes/w16s-vs15c
[w16s-vs15p]: https://atlas.hashicorp.com/gusztavvargadr/boxes/w16s-vs15p
[w16s-vs17c]: https://atlas.hashicorp.com/gusztavvargadr/boxes/w16s-vs17c
[w16s-vs17p]: https://atlas.hashicorp.com/gusztavvargadr/boxes/w16s-vs17p

[ComponentsVisualStudioYaml]: src/components/vs/vagrant.yml
[ComponentsVisualStudioSamples]: src/stacks/dotnet/vagrant.yml#L3

#### SQL Server

- sql14d - [SQL Server 2014 Developer][w16s-sql14d]

[Samples][ComponentsSQLServerSamples]

[ComponentsSQLServer]: #sql-server

[w16s-sql14d]: https://atlas.hashicorp.com/gusztavvargadr/boxes/w16s-sql14d

[ComponentsSQLServerYaml]: src/components/sql/vagrant.yml
[ComponentsSQLServerSamples]: src/stacks/dotnet/vagrant.yml#L24

#### Vagrant

[Samples][ComponentsVagrantSamples]

[ComponentsVagrant]: #vagrant

[ComponentsVagrantYaml]: src/components/vagrant/vagrant.yml
[ComponentsVagrantSamples]: src/components/vagrant/cookbooks/gusztavvargadr_workstations_vagrant/.kitchen.yml#L26
[ComponentsVagrantCookbook]: src/components/vagrant/cookbooks/gusztavvargadr_workstations_vagrant

#### Docker

[ComponentsDocker]: #docker

##### Docker Community Edition

[Samples][ComponentsDockerCSamples]

[ComponentsDockerCYaml]: src/components/dockerc/vagrant.yml
[ComponentsDockerCSamples]: src/components/dockerc/cookbooks/gusztavvargadr_workstations_dockerc/.kitchen.yml#L26
[ComponentsDockerCCookbook]: src/components/dockerc/cookbooks/gusztavvargadr_workstations_dockerc

##### Docker Enterprise Edition

[Samples][ComponentsDockerCSamples]

[ComponentsDockerEYaml]: src/components/dockere/vagrant.yml
[ComponentsDockerESamples]: src/components/dockere/cookbooks/gusztavvargadr_workstations_dockere/.kitchen.yml#L26
[ComponentsDockerECookbook]: src/components/dockere/cookbooks/gusztavvargadr_workstations_dockere

#### AWS

[Samples][ComponentsAWSSamples]

[ComponentsAWS]: #aws

[ComponentsAWSYaml]: src/components/aws/vagrant.yml
[ComponentsAWSSamples]: src/components/aws/cookbooks/gusztavvargadr_workstations_aws/.kitchen.yml#L26
[ComponentsAWSCookbook]: src/components/aws/cookbooks/gusztavvargadr_workstations_aws

#### Git

[Samples][ComponentsGitSamples]

[ComponentsGit]: #git

[ComponentsGitYaml]: src/components/git/vagrant.yml
[ComponentsGitSamples]: src/components/git/cookbooks/gusztavvargadr_workstations_git/.kitchen.yml#L26
[ComponentsGitCookbook]: src/components/git/cookbooks/gusztavvargadr_workstations_git

#### SVN

[Samples][ComponentsSVNSamples]

[ComponentsSVN]: #svn

[ComponentsSVNYaml]: src/components/svn/vagrant.yml
[ComponentsSVNSamples]: src/components/svn/cookbooks/gusztavvargadr_workstations_svn/.kitchen.yml#L26
[ComponentsSVNCookbook]: src/components/svn/cookbooks/gusztavvargadr_workstations_svn

#### NuGet

[Samples][ComponentsNuGetSamples]

[ComponentsNuGet]: #nuget

[ComponentsNuGetYaml]: src/components/nuget/vagrant.yml
[ComponentsNuGetSamples]: src/components/nuget/cookbooks/gusztavvargadr_workstations_nuget/.kitchen.yml#L26
[ComponentsNuGetCookbook]: src/components/nuget/cookbooks/gusztavvargadr_workstations_nuget

### Stacks

**In this section** [.NET][StacksDotnet] | [SQL][StacksSQL] | [Infrastructure][StacksInfrastructure]  

[Stacks]: #stacks

#### .NET

[StacksDotnet]: #net

##### .NET Core

[Samples][StacksDotnetCoreSamples]

[StacksDotnetCoreYaml]: src/stacks/dotnetcore/vagrant.yml
[StacksDotnetCoreSamples]: src/projects/identityserver/vagrant.yml#L36

##### .NET Framework

[Samples][StacksDotnetFrameworkSamples]

[StacksDotnetFrameworkYaml]: src/stacks/dotnetfx/vagrant.yml
[StacksDotnetFrameworkSamples]: src/projects/identityserver/vagrant.yml#L16

#### SQL

[Samples][StacksSQLSamples]

[StacksSQL]: #sql

[StacksSQLYaml]: src/stacks/dotnetcore/vagrant.yml
[StacksSQLSamples]: src/projects/identityserver/vagrant.yml#L18

#### Infrastructure

[Samples][StacksInfrastructureSamples]

[StacksInfrastructure]: #infrastructure

[StacksInfrastructureYaml]: src/stacks/infrastructure/vagrant.yml
[StacksInfrastructureSamples]: src/stacks/dotnetcore/vagrant.yml#L4

### Projects

[Apache] log4net  
[ASP.NET Core] Logging  
[GitHub] gitignore  
[IdentityServer] v3 v4  

[Projects]: #projects

### People

[You actual workstations](src/people/me/vagrant.yml)

```sh
clone$ cd src/people/me
clone/src/people/me$ vagrant up (work|playground|private)
```

[People]: #people

## Contributing

<!--
**Note** This section assumes you are familiar with the basics of [Chef]. If that's not the case, it's recommended that you take a quick look at its [getting started guide][ChefGettingStarted].  

[ChefGettingStarted]: https://learn.chef.io/tutorials/
-->

Any feedback, [issues] or [pull requests] are welcome and greatly appreciated. Chek out the [milestones] for the list of planned releases.

[Contributing]: #contributing

[Issues]: https://github.com/gusztavvargadr/workstations/issues
[Pull requests]: https://github.com/gusztavvargadr/workstations/pulls
[Milestones]: https://github.com/gusztavvargadr/workstations/milestones

## Resources

This repository could not exist without the following great tools:

* [Vagrant]
* [Hyper-V]
* [VirtualBox]
* [Chef]

[Resources]: #resources

[Vagrant]: https://www.vagrantup.com/
[Hyper-V]: https://en.wikipedia.org/wiki/Hyper-V
[VirtualBox]: https://www.virtualbox.org/
[Chef]: https://www.chef.io/chef/
