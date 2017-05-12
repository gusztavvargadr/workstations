# Workstations

<!--
TODO: os machines
TODO: no links in first paragraph
-->

**Quick links** [Overview] | [Getting started] | [Usage] | [Contributing] | [Resources]  

This repository contains Windows-based [workstations][Overview] for [.NET][.NET development], [SQL Server][SQL Server development], [infrastructure][Infrastructure development] and [Java development] using [Vagrant][VagrantHome], [VirtualBox][VirtualBoxHome] and [Chef][ChefHome].

## Overview

This repository contains Windows-based workstations for the following scenarios:

* [.NET development] with Visual Studio 2010, 2015 and 2017.
* [SQL Server development] with SQL Server 2014 and SQL Server Management Studio 2017.
* [Infrastructure development] with Chef, Packer and Terraform with Docker, VirtualBox and AWS.
* [Java development] with IntelliJ IDEA and Eclipse.

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

**Note** Make sure to use boxes only from [trusted sources][PackerOverview].  

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
$ vagrant up (vs10p|vs15c|vs15p|vs17c|vs17p)
```

The workstation is created by default with the following tools installed and configured:

* [Windows Server 2016 Standard][w16s]
  * vs10p - [Visual Studio 2010 Professional][w16s-vs10p]
  * vs15c - [Visual Studio 2015 Community][w16s-vs15c]
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

```
$ cd src/sql
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

```
$ cd src/infrastructure
$ vagrant up (docker|virtualbox|aws)
```

The workstation is created by default with the following tools installed and configured:

* [Windows Server 2016 Standard][w16s]
  * docker - Windows Containers
  * virtualbox - VirtualBox
  * aws - [AWS] command line tools
* [OS]
* [Git]
* [Chef][ChefHome], [Packer], [Terraform]
* [Vagrant]

[Infrastructure development]: #infrastructure-development
[Packer]: https://chocolatey.org/packages/packer
[Terraform]: https://chocolatey.org/packages/terraform

#### Java development

Boot the workstation:

```
$ cd src/java
$ vagrant up (intellij|eclipse)
```

The workstation is created by default with the following tools installed and configured:

* [Windows Server 2016 Standard][w16s]
  * intellij - [IntelliJ IDEA]
  * eclipse - [Eclipse]
* [OS]
* [Git]
* [JDK], [Maven]

[Java development]: #java-development
[JavaDevelopmentBox]: https://atlas.hashicorp.com/gusztavvargadr/boxes/w16s
[JDK]: https://chocolatey.org/packages/jdk8
[Maven]: https://chocolatey.org/packages/maven
[IntelliJ IDEA]: https://chocolatey.org/packages/intellijidea-community
[Eclipse]: https://chocolatey.org/packages/eclipse

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

[Sample](https://github.com/gusztavvargadr/workstations/compare/feature/gusztavvargadr#diff-7e49f6a25a93914e472962e1a5f0010e)

[OS]: #os

#### Git

<!--
  * Installing the core Git tools.
  * Configuring Git settings.
  * Cloning public and private repositories.
-->

[Sample](https://github.com/gusztavvargadr/workstations/compare/feature/gusztavvargadr#diff-7e49f6a25a93914e472962e1a5f0010e)

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

[Sample](https://github.com/gusztavvargadr/workstations/compare/feature/gusztavvargadr#diff-51ab84789bf0abb34b3507eceac10b5f)

[NuGet]: #nuget

#### Vagrant

<!--
* Vagrant
  * Installing Vagrant itself and its plugins.
  * Adding boxes.
-->

[Sample](https://github.com/gusztavvargadr/workstations/compare/feature/gusztavvargadr#diff-d8bb6927fd2f78a36cec508a69192d38)

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

[Sample](https://github.com/gusztavvargadr/workstations/compare/feature/gusztavvargadr#diff-0c9ca0899b76bf8e98ba5b36b38113d6)

[AWS]: #aws

### Customizing Vagrant

<!--
multi machine
options

Besides the above, you can of course add any of your own customizations using the tools [Vagrant supports][VagrantProvisioning].

[VagrantProvisioning]: https://www.vagrantup.com/docs/provisioning/
-->

[Usage]: #usage

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
