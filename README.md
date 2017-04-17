# Workstations

**Contents** [Overview] | [Getting started] | [Usage] | [Next steps] | [Contributing] | [Resources]  

This repository contains virtual Windows workstations for .NET, SQL Server, infrastructure and Java development using [Vagrant] and [VirtualBox].

[Vagrant]: https://www.vagrantup.com/
[VirtualBox]: https://www.virtualbox.org/

## Overview

You can use the workstations out of the box for the following purposes:

* .NET development with Visual Studio.
* SQL Server development with SQL Server Engine and Management Studio.
* Infrastructure development with Chef, Packer, Terraform and AWS.
* Java development with IntelliJ IDEA.

[Overview]: #overview

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

Besides the above, you can of course add any of your own customizations using the tools [Vagrant supports][VagrantProvisioning].

[VagrantProvisioning]: https://www.vagrantup.com/docs/provisioning/

## Getting started

**Note** This section assumes you are familiar with the basics of Vagrant. If that's not the case, it's recommended that you take a quick look at the [getting started guide][VagrantGettingStarted].  
**Note** The virtual environments have been tested on Windows hosts only, but they are supposed to run on any other platforms as well. [Let me know][Contributing] if you encounter any issues and I'm glad to help.  
**Note** Booting a workstation for the first time can take a significant amount of time. If you have a slow internet connection, downloading the base boxes (usually several GBs) might require some patience and retries and provisioning (e.g. installing the custom tools not included in the base box) also happens during the initial boot. However, starting the workstations again later and / or creating another one from the already downloaded base box will be significantly faster.  
**Note** All the components of the workstations (including the core operating system) are installed from their publicly available free or evaluation versions. You might need to provide your own licenses to continue using them after a given period of time. The evaluation periods usually start when booting a workstation for the first time, and remember that you can recreate them anytime.  

[Getting started]: #getting-started
[VagrantGettingStarted]: https://www.vagrantup.com/intro/getting-started/index.html

## Usage

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
TODO: install
TODO: home var
TODO: reference packer boxes
-->
