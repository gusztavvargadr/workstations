# Workstations

This repository contains virtual Windows workstations for .NET, SQL Server, infrastructure and Java development using [Vagrant] and [VirtualBox].

[Vagrant]: https://www.vagrantup.com/
[VirtualBox]: https://www.virtualbox.org/

## Overview

You can use the workstations out of the box for the following purposes:

* .NET development with Visual Studio.
* SQL Server development with SQL Server Engine and Management Studio.
* Infrastructure development with Chef, Packer, Terraform and AWS.
* Java development with IntelliJ IDEA.

### Scenarios

All of the environments support an easy, source-controlled way of customizations for the following scenarios:

* Create your workstations anytime, anywhere with your preferred settings and tools preinstalled and preconfigured. Experiment freely and just drop and recreate it if something goes wrong.
* Share the common settings, the required tools and the repositories to work with with your teammates or the people contributing to a project. Instead of documenting how to set up an environment, just write the code for it, and it's ready to use.

### Customizations

Below is a complete list of customizations supported out of the box. All of these are applied when booting your workstation the first time, so they are actually ready to use:

* Windows
  * Configuring locales, time zone and environment variables.
  * Installing OS features.
  * Installing Chocolatey and native packages.
* Git
  * Configuring Git settings.
  * Cloning public and private repositories.
* SVN
  * Checking out public and private repositories.
* NuGet
  * Adding public and private package sources.
* Docker
  * Pulling images.
* Vagrant
  * Adding base boxes.
* AWS
  * Setting up AWS CLI profiles.

Besides the above, you can of course add any other customizations using the tools [Vagrant supports][VagrantProvisioning].

[VagrantProvisioning]: https://www.vagrantup.com/docs/provisioning/

## Gettings started

## Usage

## Next steps

## Contributing

## Resources

