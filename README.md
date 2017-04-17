# Workstations

**Contents** [Overview] | [Getting started] | [Usage] | [Next steps] | [Contributing] | [Resources]  

This repository contains Windows workstations for .NET, SQL Server, infrastructure and Java development using Vagrant and VirtualBox.

## Overview

This repository contains Windows-based workstations for the following purposes:

* [.NET development] with Visual Studio.
* [SQL Server development] with SQL Server Management Studio.
* [Infrastructure development] with Chef, Packer, Terraform and AWS.
* [Java development] with IntelliJ IDEA.

All of them support an easy, source-controlled way of installing and configuring the most common development tools for the related stacks and enable managing the sources of your projects, based on [Vagrant] and [VirtualBox]. This way you can easily recreate the same workstations anytime, anywhere, and instead of writing extensive documentation, you can simply share ready to use environments with your teammates and contributors.

The most common configuration options are also supported "out of the box":

* Managing the [core OS settings] and [features] and installing [additional packages].
* Working with [Git] and [SVN] repositories.
* Managing [NuGet sources].
* Downloading [Vagrant base boxes] and pulling [Docker images].
* Setting up [AWS profiles].

You can of course extend these freely with your own configuration options and provisioning steps.

[Overview]: #overview

[.NET development]: #net-development
[SQL Server development]: #sql-server-development
[Infrastructure development]: #infrastructure-development
[Java development]: #java-development

[Vagrant]: https://www.vagrantup.com/
[VirtualBox]: https://www.virtualbox.org/

[core OS settings]: #
[features]: #
[additional packages]: #
[Git]: #
[SVN]: #
[NuGet sources]: #
[Vagrant base boxes]: #
[Docker images]: #
[AWS profiles]: #

## Getting started

**Note** This section assumes you are familiar with the basics of Vagrant. If that's not the case, it's recommended that you take a quick look at its [getting started guide][VagrantGettingStarted].  

**Note** The virtual environments have been tested on Windows hosts only, but they are supposed to run on any other platform as well. [Let me know][Contributing] if you encounter any issues and I'm glad to help.  

**Note** Booting a workstation for the first time can take a significant amount of time. If you have a slow connection, downloading the [base boxes][AtlasBoxes] (usually several GBs) might require some patience and retries. Also, provisioning (e.g. installing the custom tools not included in the base box) by default happens during the initial boot as well. However, starting the workstations again later, or creating another one from the already downloaded base box will be significantly faster.  

**Note** All the components of the workstations (including the core operating system) are installed from their publicly available [free or evaluation versions][PackerNotes]. You might need to provide your own licenses to continue using them after a given period of time. The evaluation periods usually start when booting the workstations for the first time, and remember that you can recreate them at any time.  

[Getting started]: #getting-started
[VagrantGettingStarted]: https://www.vagrantup.com/intro/getting-started/index.html
[AtlasBoxes]: https://atlas.hashicorp.com/gusztavvargadr
[PackerNotes]: https://github.com/gusztavvargadr/packer#notes

### Prerequisites

Follow the steps below to install all the required tools:

1. Install [Vagrant][VagrantInstallation] and the following plugins:
    1. [vagrant-berkshelf][VagrantBerkshelfInstallation].
    1. [vagrant-reload][VagrantReloadInstallation].
1. Install [VirtualBox][VirtualBoxInstallation].
1. Install the [Chef Development Kit][ChefDKInstallation].
1. Disable virtualization platforms other than VirtualBox. On Windows, [disable Hyper-V][HyperVDisable], in case it is running.
1. Take a moment to realize that this might have been the last time you installed anything for your workstations manually.

[VagrantInstallation]: https://www.vagrantup.com/docs/installation/
[VagrantBerkshelfInstallation]: https://github.com/berkshelf/vagrant-berkshelf#installation
[VagrantReloadInstallation]: https://github.com/aidanns/vagrant-reload#installation
[VirtualBoxInstallation]: https://www.virtualbox.org/wiki/Downloads
[ChefDKInstallation]: https://downloads.chef.io/chef-dk/
[HyperVDisable]: https://blogs.technet.microsoft.com/gmarchetti/2008/12/07/turning-hyper-v-on-and-off/

### Creating the workstations

#### .NET development

#### SQL Server development

#### Infrastructure development

#### Java development

## Usage

<!--
### Scenarios

All of the environments support an easy, source-controlled way of customizations for the following scenarios:

* Create your workstations anytime, anywhere with your preferred tools preinstalled and your preferred settings preconfigured. Experiment freely and just destroy and recreate it if something goes wrong.
* Share the common settings, the required tools and the repositories to work with with your teammates or with the people contributing to your project. Instead of documenting how to set up an environment, just write the code for it, and it's ready to use.

### Customizations

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
