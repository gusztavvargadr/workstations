# Workstations

**Quick links** [Vagrant resources] | [Virtual workstations] | [Vagrant boxes] | [Packer templates]  

[This repository][Virtual workstations] contains Windows-based virtual workstations for .NET, SQL and infrastructure development using Vagrant with Hyper-V and VirtualBox.

[Vagrant resources]: https://github.com/gusztavvargadr/vagrant
[Virtual workstations]: https://github.com/gusztavvargadr/workstations

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

1. Install [VirtualBox][VirtualBoxInstallation]. It is recommended to have VirtualBox version 5.2.22 or later on the host.
    - Optionally, if you plan to use VirtualBox by default, add the [environment variable][VagrantEnvDefaultProvider] `VAGRANT_DEFAULT_PROVIDER` with the value of `virtualbox` to prevent specifying it every time a machine is [booted][VagrantCliUpProvider].
    - Optionally, add the [environment variable][VagrantCoreVirtualBoxLinkedClone] `VAGRANT_LINKED_CLONE` to save some disk space using [linked clones][VagrantVirtualBoxLinkedClone].

[Using VirtualBox]: #using-virtualbox

[VirtualBoxInstallation]: https://www.virtualbox.org/wiki/Downloads
[VagrantCoreVirtualBoxLinkedClone]: src/Vagrantfile.core.rb#L30
[VagrantVirtualBoxLinkedClone]: https://www.vagrantup.com/docs/virtualbox/configuration.html#linked-clones

### Creating your first workstation

<!--
TODO: samples: add output of Vagrant
-->

**Note** Booting a workstation for the first time can take a significant amount of time. If you have a slow connection, downloading the [Vagrant boxes] - usually several GBs for Windows guests - might require some patience and retries. Creating another machine from the same box later though will reuse the already downloaded one of course.  

**Note** Configuring the core OS after Sysprep (to support actually unique virtual machines) and provisioning the workstations (e.g. installing the custom tools not included in the [Packer templates]) by default happens during the initial boot as well. However, starting the machines again later will not need these steps, so the process will be significantly faster.  

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

The list shows the three default workstations, `work` intended to support the projects you work on, `playground` for generic experiments, and `private` for anything else, like communication or generic office work. None of these exsit yet, so for example, to create the `playground` one, simply invoke `vagrant up`:

```sh
clone/src/people/me$ vagrant up playground
```

Now, it's time to be patient. The box - in this case, by default with [Visual Studio 2017 Community][w16s-dc-vs17c] including [Windows Server 2016 Standard][w16s] - will be downloaded and the machine will be provisioned before the first use to include all the components this repository supports. If this is not the configuration that you want, you can terminate the process anytime.

Once the machine is ready, you can connect to it with RDP or open a remote shell using the default credentials, `vagrant` for both the user name and password:

```sh
clone/src/people/me$ vagrant rdp playground
clone/src/people/me$ vagrant ssh playground
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

[Vagrant boxes]: https://app.vagrantup.com/gusztavvargadr
[Packer templates]: https://github.com/gusztavvargadr/packer

## Usage

<!--
TODO: download optimization and / or build own
TODO: vagrant options
TODO: vagrant extensions (e.g. ruby block)
-->

**In this section** [Basics] | [Components] | [Stacks] | [Projects] | [People]  

**Note** At this point you might want to [fork this repository][Fork] and create your own branch to save your changes and to [compare your workstations][Compare] easily with others.

Take a moment to realize that this might have been the last time you installed something for your workstations manually.

[Usage]: #usage

[Fork]: https://help.github.com/articles/fork-a-repo/
[Compare]: https://github.com/gusztavvargadr/workstations/compare/people/gusztavvargadr#files_bucket

### Basics

**In this section** [Configuration] | [Provisioning]  

This repository uses custom [Vagrant extensions][VagrantCore] to enable creating and reusing dynamic configurations based on [YAML] and [ERB] for the most common machine parameters and provisioning options.

[Basics]: #basics

[VagrantCore]: src/Vagrantfile.core.rb
[YAML]: https://en.wikipedia.org/wiki/YAML
[ERB]: http://www.stuartellis.name/articles/erb/

#### Configuration

For example, you can define some [reasonable defaults][ComponentsCore] to be applied to every configuration:

```yml
# src/components/core/vagrant.yml
core:
  provider:
    memory: 8192
    cpus: 4
```
[Source][ComponentsCoreYaml]

This means that by default the machines will allocate 8 GB RAM and 4 virtual CPUs.

Also, you can define how [components][Components], like the [core OS][ComponentsOS] is being provisioned:

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
[Source][ComponentsOSYaml]

This shows that the custom [OS cookbook][ComponentsOSCookbook] will be used for provisioning, and the specified values, in this case, `en-US` for all the locales and `UTC` for the timezone will be set. The cookbooks provide [complete samples][ComponentsOSSamples] for the scenarios they support so you can define only the options you need.

YAML files are processed as ERB-templates first, so for example you can dynamically set the host's timezone for the guest:

```yaml
timezone: <%= `tzutil /g`.strip %>
```

This approach can be also used to e.g. pass secrets or other sensitive information to the guests without hard-coding them, retrieving the values for example from host environment variables dynamically.

You can also define further parameters for Vagrant, in this case, a base box specifying the [Visual Studio][ComponentsVisualStudio] version being used:

```yml
# src/components/vs/vagrant.yml
core:
  includes:
    - components/core/core

17c:
  includes:
    - components/vs/core
  box: w16s-dc-vs17c
```
[Source][ComponentsVisualStudioYaml]

In this case the configuration named `components/vs/17c` will use the [Visual Studio 2017 Community][w16s-dc-vs17c] box including [Windows Server 2016 Standard][w16s]. This options is very useful for tools which take significant time to install, so instead of applying them on the first boot, they can be already included in the [Vagrant boxes].

You can also see how the existing configuration is being reused. `components/vs/17c` includes `components/vs/core`, which in turn includes the above `components/core/core` (specifying the memory and the CPU settings). As the list notation suggests, you can include any number or other configurations. If you specify a single value (like the `box`) defined earlier, it will be overridden. Collections (for example, the list of `cookbooks`) will be merged, the new values being added after the existing ones.

Components like to appear in groups to form [stacks], like using a dedicated .NET version and the related hosting options for local development. For example, for [.NET Core][StacksDotnetCore] you can define to use [Docker][ComponentsDocker] with the usual images:

```yml
# src/stacks/dotnetcore/vagrant.yml
core:
  includes:
    - stacks/dotnet/core
    - stacks/infrastructure/dockere
  chef:
    json:
      gusztavvargadr_workstations_dockere:
        profiles:
          images:
            microsoft/dotnet:sdk-nanoserver:

library:
  includes:
    - stacks/dotnetcore/core
    - stacks/dotnet/library

web:
  includes:
    - stacks/dotnetcore/core
    - stacks/dotnet/web
  chef:
    json:
      gusztavvargadr_workstations_dockere:
        profiles:
          images:
            microsoft/aspnetcore-build:nanoserver:
```
[Source][StacksDotnetCoreYaml]

The referenced [generic .NET][StacksDotnet] configuration specifies the default Visual Studio version which you've seen before and includes [NuGet][ComponentsNuGet] as well:

```yml
# src/stacks/dotnet/vagrant.yml
core:
  includes:
    - components/vs/v17c
    - components/nuget/core

library:
  includes:
    - stacks/dotnet/core

web:
  includes:
    - stacks/dotnet/core
```
[Source][StacksDotnetYaml]

Stacks aren't of course l'art pour l'art, but to be used in [projects]. For example, to define the core repositories of the one and only [IdentityServer], you can use the following configuration:

```yml
# src/projects/identityserver/vagrant.yml
core:
  includes:
    - components/git/core
  chef:
    json:
      gusztavvargadr_workstations_git:
        profiles:
          workspaces:
            identityserver:
              address: https://github.com/identityserver
              directory: /Users/vagrant/Repos/identityserver

v4:
  includes:
    - projects/identityserver/core
    - stacks/dotnetcore/library
    - stacks/dotnetcore/web
  chef:
    json:
      gusztavvargadr_workstations_git:
        profiles:
          workspaces:
            identityserver:
              repositories:
                IdentityServer4:
                  directory: v4/core
                IdentityServer4.AccessTokenValidation:
                  directory: v4/accesstokenvalidation
                IdentityServer4.Samples:
                  directory: v4/samples
```
[Source][ProjectsIdentityServerYaml]

This configuration, being referenced in your workstation will check out the mentioned repositories using [Git][ComponentsGit], and install the tools and pull the images as you've seen above. 

Finally, you can define [your workstation][People] to include projects like this:

```yml
# src/people/me/vagrant.yml
work:
  includes:
    - components/os/w16s
    - projects/identityserver/v4
  default: true
```
[Source][PeopleYaml]

And have your `Vagrantfile` reference the YAML configuration:

```ruby
# src/people/me/Vagrantfile
directory = File.dirname(__FILE__)
require "#{directory}/../../Vagrantfile.core"

Vagrant.configure('2') do |config|
  gusztavvargadr_workstations_vm config, directory, 'work'
end
```
[Source][PeopleVagrantfile]

This is a quick introduction of what happens behind the scenes when you invoke `vagrant up`.

[Configuration]: #configuration

#### Provisioning

<!--
TODO: vagrant output samples
-->

Even if being run in a VM with Hyper-V or VirtualBox, Windows still loves to be restarted, and this is especially the case during provisioning, when e.g. Windows Features or specific tools get installed. To support those scenarios when provisioning would require the use of another component which just got installed, but it requires a restart, all the custom cookbooks support being executed in different stages, and the custom Vagrant extension will [restart the machine][VagrantCoreRestart] between them.

In the `requirements` stage core settings like Windows Features and environment variables get installed and configured.

After those have been set up correctly, the `tools` stage is used to install e.g. Chocolatey packages or applications with native installers.

Finally, in the `profiles` stage all the tools can now be used properly, for example, to clone Git repositories or manage NuGet sources.

[Provisioning]: #provisioning

[VagrantCoreRestart]: src/Vagrantfile.core.rb#L37

### Components

<!--
TODO: kitchen samples annotated - multiple instances where available
-->

**In this section** [Core][ComponentsCore] | [OS][ComponentsOS] | [Visual Studio][ComponentsVisualStudio] | [SQL Server][ComponentsSQLServer] | [Vagrant][ComponentsVagrant] | [Docker][ComponentsDocker] | [AWS][ComponentsAWS] | [Git][ComponentsGit] | [SVN][ComponentsSVN] | [NuGet][ComponentsNuGet]  

See below the list of components with their features supported out of the box.

[Components]: #components

#### Core

- Sets environment variables
- Enables Windows Features
- Installs Chocolatey packages
- Installs native packages
- Copies files to the host

[Source][ComponentsCoreYaml]  
[Samples][ComponentsCoreSamples]  

[ComponentsCore]: #core

[ComponentsCoreYaml]: src/components/core/vagrant.yml
[ComponentsCoreSamples]: src/components/core/cookbooks/gusztavvargadr_workstations_core/.kitchen.yml#L25
[ComponentsCoreCookbook]: src/components/core/cookbooks/gusztavvargadr_workstations_core

#### OS

- Selects a box with the core OS preinstalled
  - w10e - [Windows 10 Enterprise][w10e]
  - w16s - [Windows Server 2016 Standard][w16s]
- Configures locales
- Configures timezone

[Source][ComponentsOSYaml]  
[Samples][ComponentsOSSamples]  

[ComponentsOS]: #os

[w10e]: https://app.vagrantup.com/gusztavvargadr/boxes/w10e
[w16s]: https://app.vagrantup.com/gusztavvargadr/boxes/w16s

[ComponentsOSYaml]: src/components/os/vagrant.yml
[ComponentsOSSamples]: src/components/os/cookbooks/gusztavvargadr_workstations_os/.kitchen.yml#L26
[ComponentsOSCookbook]: src/components/os/cookbooks/gusztavvargadr_workstations_os

#### Visual Studio

- Selects a box with Visual Studio preinstalled
  - v17c - [Visual Studio 2017 Community][w16s-dc-vs17c]
  - v17p - [Visual Studio 2017 Professional][w16s-dc-vs17p]

[Source][ComponentsVisualStudioYaml]  
[Samples][ComponentsVisualStudioSamples]  

[ComponentsVisualStudio]: #visual-studio

[w16s-dc-vs17c]: https://app.vagrantup.com/gusztavvargadr/boxes/w16s-dc-vs17c
[w16s-dc-vs17p]: https://app.vagrantup.com/gusztavvargadr/boxes/w16s-dc-vs17p

[ComponentsVisualStudioYaml]: src/components/vs/vagrant.yml
[ComponentsVisualStudioSamples]: src/stacks/dotnet/vagrant.yml#L3

#### SQL Server

- Selects a box with SQL Server preinstalled
  - v14d - [SQL Server 2014 Developer][w16s-sql14d]
  - v17d - [SQL Server 2017 Developer][w16s-sql17d]

[Source][ComponentsSQLServerYaml]  
[Samples][ComponentsSQLServerSamples]  

[ComponentsSQLServer]: #sql-server

[w16s-sql14d]: https://app.vagrantup.com/gusztavvargadr/boxes/w16s-sql14d
[w16s-sql17d]: https://app.vagrantup.com/gusztavvargadr/boxes/w16s-sql17d

[ComponentsSQLServerYaml]: src/components/sql/vagrant.yml
[ComponentsSQLServerSamples]: src/projects/identityserver/vagrant.yml#L18

#### Vagrant

- Installs Vagrant
- Installs plugins
- Adds boxes

[Source][ComponentsVagrantYaml]  
[Samples][ComponentsVagrantSamples]  

[ComponentsVagrant]: #vagrant

[ComponentsVagrantYaml]: src/components/vagrant/vagrant.yml
[ComponentsVagrantSamples]: src/components/vagrant/cookbooks/gusztavvargadr_workstations_vagrant/.kitchen.yml#L32
[ComponentsVagrantCookbook]: src/components/vagrant/cookbooks/gusztavvargadr_workstations_vagrant

#### Docker

[ComponentsDocker]: #docker

##### Docker Community Edition

- Installs Docker Community Edition (Edge) (requires Hyper-V host and Windows Server 2016 guest)
- Pulls Docker images

[Source][ComponentsDockerCYaml]  
[Samples][ComponentsDockerCSamples]  

[ComponentsDockerCYaml]: src/components/dockerc/vagrant.yml
[ComponentsDockerCSamples]: src/components/dockerc/cookbooks/gusztavvargadr_workstations_dockerc/.kitchen.yml#L41
[ComponentsDockerCCookbook]: src/components/dockerc/cookbooks/gusztavvargadr_workstations_dockerc

##### Docker Enterprise Edition

- Installs Docker Enterprise Edition (requires Windows Server 2016 guest)
- Pulls Docker images

[Source][ComponentsDockerEYaml]  
[Samples][ComponentsDockerESamples]  

[ComponentsDockerEYaml]: src/components/dockere/vagrant.yml
[ComponentsDockerESamples]: src/components/dockere/cookbooks/gusztavvargadr_workstations_dockere/.kitchen.yml#L29
[ComponentsDockerECookbook]: src/components/dockere/cookbooks/gusztavvargadr_workstations_dockere

#### AWS

- Installs the AWS command-line tools
- Configures AWS profiles

[Source][ComponentsAWSYaml]  
[Samples][ComponentsAWSSamples]  

[ComponentsAWS]: #aws

[ComponentsAWSYaml]: src/components/aws/vagrant.yml
[ComponentsAWSSamples]: src/components/aws/cookbooks/gusztavvargadr_workstations_aws/.kitchen.yml#L30
[ComponentsAWSCookbook]: src/components/aws/cookbooks/gusztavvargadr_workstations_aws

#### Git

- Installs Git
- Clones public or private repositories

[Source][ComponentsGitYaml]  
[Samples][ComponentsGitSamples]  

[ComponentsGit]: #git

[ComponentsGitYaml]: src/components/git/vagrant.yml
[ComponentsGitSamples]: src/components/git/cookbooks/gusztavvargadr_workstations_git/.kitchen.yml#L33
[ComponentsGitCookbook]: src/components/git/cookbooks/gusztavvargadr_workstations_git

#### SVN

- Installs SVN
- Checks out public or private repositories

[Source][ComponentsSVNYaml]  
[Samples][ComponentsSVNSamples]

[ComponentsSVN]: #svn

[ComponentsSVNYaml]: src/components/svn/vagrant.yml
[ComponentsSVNSamples]: src/components/svn/cookbooks/gusztavvargadr_workstations_svn/.kitchen.yml#L30
[ComponentsSVNCookbook]: src/components/svn/cookbooks/gusztavvargadr_workstations_svn

#### NuGet

- Installs NuGet
- Adds sources

[Source][ComponentsNuGetYaml]  
[Samples][ComponentsNuGetSamples]  

[ComponentsNuGet]: #nuget

[ComponentsNuGetYaml]: src/components/nuget/vagrant.yml
[ComponentsNuGetSamples]: src/components/nuget/cookbooks/gusztavvargadr_workstations_nuget/.kitchen.yml#L30
[ComponentsNuGetCookbook]: src/components/nuget/cookbooks/gusztavvargadr_workstations_nuget

### Stacks

**In this section** [.NET][StacksDotnet] | [SQL][StacksSQL] | [Infrastructure][StacksInfrastructure]  

See below the list of stacks with their components configured out of the box.

[Stacks]: #stacks

#### .NET

- Defines the base box for Visual Studio
- Configures tools and settings for .NET class libraries
- Configures tools and settings for .NET web applications

[Source][StacksDotnetYaml]  
[Samples][StacksDotnetSamples]  

[StacksDotnet]: #net

[StacksDotnetYaml]: src/stacks/dotnet/vagrant.yml
[StacksDotnetSamples]: src/stacks/dotnetcore/vagrant.yml#L3

##### .NET Core

- Configures tools and settings for .NET Core class libraries including Docker
- Configures tools and settings for .NET Core web applications including Docker

[Source][StacksDotnetCoreYaml]  
[Samples][StacksDotnetCoreSamples]  

[StacksDotnetCore]: #net-core

[StacksDotnetCoreYaml]: src/stacks/dotnetcore/vagrant.yml
[StacksDotnetCoreSamples]: src/projects/identityserver/vagrant.yml#L36

##### .NET Framework

- Configures tools and settings for .NET Framework class libraries
- Configures tools and settings for .NET Framework web applications

[Source][StacksDotnetFrameworkYaml]  
[Samples][StacksDotnetFrameworkSamples]  

[StacksDotnetFramework]: #net-framework

[StacksDotnetFrameworkYaml]: src/stacks/dotnetfx/vagrant.yml
[StacksDotnetFrameworkSamples]: src/projects/identityserver/vagrant.yml#L16

#### SQL

- Defines the base box for SQL Server versions
- Installs SQL Server Management Studio 17

[Source][StacksSQLYaml]  
[Samples][StacksSQLSamples]  

[StacksSQL]: #sql

[StacksSQLYaml]: src/stacks/sql/vagrant.yml
[StacksSQLSamples]: src/projects/identityserver/vagrant.yml#L18

#### Infrastructure

- Installs Vagrant with Chef, Packer and the related Vagrant plugins
- Installs either:
  - Docker Community Edition
  - Docker Enterprise Edition
  - VirtualBox
  - AWS command-line tools

[Source][StacksInfrastructureYaml]  
[Samples][StacksInfrastructureSamples]  

[StacksInfrastructure]: #infrastructure

[StacksInfrastructureYaml]: src/stacks/infrastructure/vagrant.yml
[StacksInfrastructureSamples]: src/stacks/dotnetcore/vagrant.yml#L4

### Projects

Below is a list of a few sample projects to demonstrate the grouping of source code with the required development and deployment tools: 

Using [Git][ComponentsGit]:
- [GitHub][ProjectsGitHubYaml]
  - `projects/github/git`
- [ASP.NET Core][ProjectsAspNetCoreYaml] Logging
  - `projects/aspnet/logging`
- [IdentityServer][ProjectsIdentityServerYaml]
  - `projects/identityserver/v3`
  - `projects/identityserver/v4`

Using [SVN][ComponentsSVN]:
- [Apache][ProjectsApacheYaml]
  - `projects/apache/log4net`

[Projects]: #projects

[ProjectsGitHubYaml]: src/projects/github/vagrant.yml
[ProjectsAspNetCoreYaml]: src/projects/aspnet/vagrant.yml
[ProjectsIdentityServerYaml]: src/projects/identityserver/vagrant.yml
[IdentityServer]: https://identityserver.io/

[ProjectsApacheYaml]: src/projects/apache/vagrant.yml

### People

[Your actual workstations][PeopleYaml] reference the above [components], [stacks] and [projects] and now can [ask Vagrant][PeopleVagrantfile] to create them.

```sh
clone$ cd src/people/me
clone/src/people/me$ vagrant up (work|playground|private)
```

The current samples contain only a single personal configuration, but this approach can be used to define baseline configurations for teams or organizations. Simple create a new folder within `src/people` for your entities, and include the projects and stacks you require as you've seen above. Then include the team or organizaton in your personal one according to your current membership or projects you want to work with.

[People]: #people
[PeopleYaml]: src/people/me/vagrant.yml
[PeopleVagrantfile]: src/people/me/Vagrantfile 

## Contributing

Any feedback, [issues] or [pull requests] are welcome and greatly appreciated. Chek out the [milestones] for the list of planned releases.

<!--
TODO: Extending - adding new cookbooks
TODO: Extending - adding new Vagrant envs

**Note** This section assumes you are familiar with the basics of [Chef]. If that's not the case, it's recommended that you take a quick look at its [getting started guide][ChefGettingStarted].  

[ChefGettingStarted]: https://learn.chef.io/tutorials/
-->

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
