# Workstations

**Contents** [Overview] | [Getting started] | [Usage] | [Next steps] | [Contributing] | [Resources]  

This repository contains Windows workstations for .NET, SQL Server, infrastructure and Java development using Vagrant and VirtualBox.

## Overview

This repository contains Windows-based workstations for the following purposes:

* [.NET development] with Visual Studio.
* [SQL Server development] with SQL Server Management Studio.
* [Infrastructure development] with Chef, Packer, Terraform and AWS.
* [Java development] with IntelliJ IDEA.

All of them support an easy, source-controlled way of installing and configuring the most common development tools for the related stacks and the management of the sources of your projects, based on [Vagrant] and [VirtualBox]. This way you can easily recreate the same workstations anytime, anywhere, and instead of writing extensive documentation, you can simply share ready to use environments with your teammates and contributors.

The most common configuration options are also supported "out of the box":

* Managing the [OS] settings, installing features and additional packages.
* Working with [Git] and [SVN] repositories.
* Managing [NuGet] sources.
* Downloading [Vagrant] base boxes and pulling [Docker] images.
* Setting up [AWS] profiles.

Of course, you can extend these freely with your own configuration options and provisioning steps.

[Overview]: #overview

[Vagrant]: https://www.vagrantup.com/
[VirtualBox]: https://www.virtualbox.org/

## Getting started

**Note** This section assumes you are familiar with the basics of Vagrant. If that's not the case, it's recommended that you take a quick look at its [getting started guide][VagrantGettingStarted].  

**Note** The virtual environments have been tested on Windows hosts only, but they are supposed to run on any other platform as well. [Let me know][Contributing] if you encounter any issues and I'm glad to help.  

**Note** Booting a workstation for the first time can take a significant amount of time. If you have a slow connection, downloading the [base boxes][AtlasBoxes] (usually several GBs) might require some patience and retries. Also, provisioning (e.g. installing the custom tools not included in the base box) by default happens during the initial boot as well. However, starting the workstations again later, or creating another one from the already downloaded base box will be significantly faster.  

**Note** All the components of the workstations (including the core operating system) are installed from their publicly available [free or evaluation versions][PackerNotes].  

[Getting started]: #getting-started
[VagrantGettingStarted]: https://www.vagrantup.com/intro/getting-started/index.html
[AtlasBoxes]: https://atlas.hashicorp.com/gusztavvargadr
[PackerNotes]: https://github.com/gusztavvargadr/packer#notes

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

Clone this repo and navigate to the root directory of the clone from your shell. Then follow the steps below to create any of the specific workstations.

#### .NET development

Boot the workstation:

```
$ cd src/dotnet
$ vagrant up
```

Connect to it via RDP or use the shell:

```
$ vagrant rdp
$ vagrant powershell
```

The workstation is created by default with the following tools installed and configured:

* [Windows Server 2016 Standard, Visual Studio 2015 Community, SQL Server 2014 Developer][.NETDevelopmentBox]
* [Docker]
* [Git]
* [NuGet]

[.NET development]: #net-development
[.NETDevelopmentBox]: https://atlas.hashicorp.com/gusztavvargadr/boxes/w16s-sql14d-vs15c

#### SQL Server development

Boot the workstation:

```
$ cd src/sql
$ vagrant up
```

Connect to it via RDP or use the shell:

```
$ vagrant rdp
$ vagrant powershell
```

The workstation is created by default with the following tools installed and configured:

* [Windows Server 2016 Standard, SQL Server 2014 Developer][SQLServerDevelopmentBox]
* [Docker]
* [Git]

[SQL Server development]: #sql-server-development
[SQLServerDevelopmentBox]: https://atlas.hashicorp.com/gusztavvargadr/boxes/w16s-sql14d

#### Infrastructure development

Boot the workstation:

```
$ cd src/infrastructure
$ vagrant up
```

Connect to it via RDP or use the shell:

```
$ vagrant rdp
$ vagrant powershell
```

The workstation is created by default with the following tools installed and configured:

* [Windows Server 2016 Standard][InfrastructureDevelopmentBox]
* [Docker]
* [Git]
* [Chef DK], [Packer], [Terraform]
* [Vagrant]
* [AWS]

[Infrastructure development]: #infrastructure-development
[InfrastructureDevelopmentBox]: https://atlas.hashicorp.com/gusztavvargadr/boxes/w16s

#### Java development

Boot the workstation:

```
$ cd src/java
$ vagrant up
```

Connect to it via RDP or use the shell:

```
$ vagrant rdp
$ vagrant powershell
```

The workstation is created by default with the following tools installed and configured:

* [Windows Server 2016 Standard][JavaDevelopmentBox]
* [Docker]
* [Git]
* [JDK], [Maven], [IntelliJ IDEA]

[Java development]: #java-development
[JavaDevelopmentBox]: https://atlas.hashicorp.com/gusztavvargadr/boxes/w16s

## Usage

<!--

Below is a complete list of customizations supported out of the box. All of these are applied when booting your workstations for the first time, so they are actually ready to use when they are up:

* Windows
  * Configuring locales, time zone and environment variables.
  * Installing OS features.
  * Installing Chocolatey and native packages.
* Git
  * Installing the core Git tools.
  * Configuring Git settings.
  * Cloning public and private repositories.
* SVN
  * Installing the core SVN tools.
  * Checking out public and private repositories.
* NuGet
  * Installing the core NuGet tools.
  * Adding public and private package sources.
* Vagrant
  * Installing Vagrant itself and its plugins.
  * Adding base boxes.
* Docker
  * Installing the core Docker tools.
  * Pulling images.
* AWS
  * Installing the core AWS tools.
  * Setting up AWS CLI profiles.

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

[Resources]: #resources

<!--
TODO: home var
TODO: reference packer boxes
-->
