# Workstations

<!--
TODO: getting started - home var
TODO: customization - reprovision note
TODO: contributing - extending: new workstations, custom provisioning
-->

**Contents** [Overview] | [Getting started] | [Usage] | [Next steps] | [Contributing] | [Resources]  

This repository contains Windows-based [workstations][Overview] for [.NET][.NET development], [SQL Server][SQL Server development], [infrastructure][Infrastructure development] and [Java development] using [Vagrant][VagrantHome], [VirtualBox][VirtualBoxHome] and [Chef][ChefHome].

## Overview

This repository contains Windows-based workstations for the following scenarios:

* [.NET development] with Visual Studio.
* [SQL Server development] with SQL Server Management Studio.
* [Infrastructure development] with Chef, Packer, Terraform and AWS.
* [Java development] with IntelliJ IDEA.

All of them support an easy, source-controlled way of installing and configuring the most common development tools for the related stacks, and the management of the source code of your projects, based on [Vagrant][VagrantHome], [VirtualBox][VirtualBoxHome] and [Chef][ChefHome]:

* Managing the core [OS] settings, installing features and custom packages.
* Working with [Git] and [SVN] repositories.
* Managing [NuGet] sources.
* Downloading [Vagrant] boxes and pulling [Docker] images.
* Setting up [AWS] profiles.

This way you can easily create the same workstations anytime, anywhere, and instead of writing extensive documentation, you can simply share the ready to use environments with your teammates and contributors. Of course, you can extend these options freely with any of your own configuration and provisioning steps.

[Overview]: #overview

## Getting started

**Note** This section assumes you are familiar with the basics of [Vagrant][VagrantHome]. If that's not the case, it's recommended that you take a quick look at its [getting started guide][VagrantGettingStarted].  

**Note** The virtual environments have been tested on Windows hosts only, but they are supposed to run on any other platform as well. [Let me know][Contributing] if you encounter any issues and I'm glad to help.  

**Note** Booting a workstation for the first time can take a significant amount of time. If you have a slow connection, downloading the [boxes][AtlasBoxes] (usually several GBs) might require some patience and retries. Also, configuring the core OS after Sysprep (to support actually unique virtual machines) and provisioning (e.g. installing the custom tools not included in the boxes) by default happens during the initial boot as well. However, starting the workstations again later, or creating another one from the already downloaded boxes will not need these steps, so the process will be significantly faster.  

**Note** All the components of the workstations (including the core OS) are installed based on their publicly available [free or evaluation versions][PackerOverview].  

[Getting started]: #getting-started
[VagrantGettingStarted]: https://www.vagrantup.com/intro/getting-started/index.html
[AtlasBoxes]: https://atlas.hashicorp.com/gusztavvargadr
[PackerOverview]: https://github.com/gusztavvargadr/packer#overview

### Prerequisites

Follow the steps below to install the required tools:

1. Install the [Chef Development Kit][ChefDKInstallation].
1. Install [Vagrant][VagrantInstallation] and the following plugins:
    1. [vagrant-berkshelf][VagrantBerkshelfInstallation].
    1. [vagrant-reload][VagrantReloadInstallation].
1. Install [VirtualBox][VirtualBoxInstallation].
1. Disable virtualization platforms other than VirtualBox. On Windows, [disable Hyper-V][HyperVDisable], in case it is running.
1. Take a moment to realize that this might have been the last time you installed something for your workstations manually.

[VagrantInstallation]: https://www.vagrantup.com/docs/installation/
[VagrantBerkshelfInstallation]: https://github.com/berkshelf/vagrant-berkshelf#installation
[VagrantReloadInstallation]: https://github.com/aidanns/vagrant-reload#installation
[VirtualBoxInstallation]: https://www.virtualbox.org/wiki/Downloads
[ChefDKInstallation]: https://downloads.chef.io/chef-dk/
[HyperVDisable]: https://blogs.technet.microsoft.com/gmarchetti/2008/12/07/turning-hyper-v-on-and-off/

### Creating the workstations

Clone this repo and navigate to the root directory of the clone using your shell. Then follow the steps below to create any of the specific workstations.

#### .NET development

Boot the workstation:

```
$ cd src/dotnet
$ vagrant up
```

The workstation is created by default with the following tools installed and configured:

* [Windows Server 2016 Standard, Visual Studio 2015 Community, SQL Server 2014 Developer][.NETDevelopmentBox]
* [OS]
* [Git]
* [Vagrant]
* [Docker]
* [NuGet]

Connect to the workstation via RDP or use the shell:

```
$ vagrant rdp
$ vagrant powershell
```

[.NET development]: #net-development
[.NETDevelopmentBox]: https://atlas.hashicorp.com/gusztavvargadr/boxes/w16s-sql14d-vs15c

#### SQL Server development

Boot the workstation:

```
$ cd src/sql
$ vagrant up
```

The workstation is created by default with the following tools installed and configured:

* [Windows Server 2016 Standard, SQL Server 2014 Developer][SQLServerDevelopmentBox]
* [OS]
* [Git]
* [Vagrant]
* [Docker]

Connect to the workstation via RDP or use the shell:

```
$ vagrant rdp
$ vagrant powershell
```

[SQL Server development]: #sql-server-development
[SQLServerDevelopmentBox]: https://atlas.hashicorp.com/gusztavvargadr/boxes/w16s-sql14d

#### Infrastructure development

Boot the workstation:

```
$ cd src/infrastructure
$ vagrant up
```

The workstation is created by default with the following tools installed and configured:

* [Windows Server 2016 Standard][InfrastructureDevelopmentBox]
* [OS]
* [Git]
* [Vagrant]
* [Docker]
* [AWS]
* [Packer], [Terraform]

Connect to the workstation via RDP or use the shell:

```
$ vagrant rdp
$ vagrant powershell
```

[Infrastructure development]: #infrastructure-development
[InfrastructureDevelopmentBox]: https://atlas.hashicorp.com/gusztavvargadr/boxes/w16s
[Packer]: https://chocolatey.org/packages/packer
[Terraform]: https://chocolatey.org/packages/terraform

#### Java development

Boot the workstation:

```
$ cd src/java
$ vagrant up
```

The workstation is created by default with the following tools installed and configured:

* [Windows Server 2016 Standard][JavaDevelopmentBox]
* [OS]
* [Git]
* [Vagrant]
* [Docker]
* [JDK], [Maven], [IntelliJ IDEA]

Connect to the workstation via RDP or use the shell:

```
$ vagrant rdp
$ vagrant powershell
```

[Java development]: #java-development
[JavaDevelopmentBox]: https://atlas.hashicorp.com/gusztavvargadr/boxes/w16s
[JDK]: https://chocolatey.org/packages/jdk8
[Maven]: https://chocolatey.org/packages/maven
[IntelliJ IDEA]: https://chocolatey.org/packages/intellijidea-community

## Usage

**Note** This section assumes you are familiar with the basics of [Chef][ChefHome]. If that's not the case, it's recommended that you take a quick look at its [getting started guide][ChefGettingStarted].  

[ChefGettingStarted]: https://learn.chef.io/tutorials/

### Customizing provisioning

See below the complete list of provisioning customization options supported out of the box. 

#### OS

<!--
  * Configuring locales, time zone and environment variables.
  * Installing OS features.
  * Installing Chocolatey and native packages.
-->

[OS]: #os

#### Git

<!--
  * Installing the core Git tools.
  * Configuring Git settings.
  * Cloning public and private repositories.
-->

[Git]: #git

#### SVN

<!--
* SVN
  * Installing the core SVN tools.
  * Checking out public and private repositories.
-->

[SVN]: #svn

#### NuGet

<!--
* NuGet
  * Installing the core NuGet tools.
  * Adding public and private package sources.
-->

[NuGet]: #nuget

#### Vagrant

<!--
* Vagrant
  * Installing Vagrant itself and its plugins.
  * Adding boxes.
-->

[Vagrant]: #vagrant

#### Docker

<!--
* Docker
  * Installing the core Docker tools.
  * Pulling images.
-->

[Docker]: #docker

#### AWS

<!--
* AWS
  * Installing the core AWS tools.
  * Setting up AWS CLI profiles.
-->

[AWS]: #aws

### Customizing Vagrant

<!--
multi machine
options

Besides the above, you can of course add any of your own customizations using the tools [Vagrant supports][VagrantProvisioning].

[VagrantProvisioning]: https://www.vagrantup.com/docs/provisioning/

-->

[Usage]: #usage

## Next steps

[Next steps]: #next-steps

## Contributing

Any feedback, [issues] and / or [pull requests] are welcome and greatly appreciated.

[Contributing]: #contributing
[Issues]: https://github.com/gusztavvargadr/workstations/issues
[Pull requests]: https://github.com/gusztavvargadr/workstations/pulls

## Resources

* [Vagrant][VagrantHome]
* [VirtualBox][VirtualBoxHome]
* [Chef][ChefHome]

[Resources]: #resources
[VagrantHome]: https://www.vagrantup.com/
[VirtualBoxHome]: https://www.virtualbox.org/
[ChefHome]: https://www.chef.io/chef/
