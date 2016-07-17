# packer-templates

[![Travis](https://img.shields.io/travis/kaorimatz/packer-templates.svg?style=flat-square)](https://travis-ci.org/kaorimatz/packer-templates)

[Packer](https://www.packer.io/) templates for [Vagrant](https://www.vagrantup.com/) base boxes

## Usage

Clone the repository:

    $ git clone https://github.com/kaorimatz/packer-templates && cd packer-templates

Build a machine image from the template in the repository:

    $ packer build -only=virtualbox-iso archlinux-x86_64.json

Add the built box to Vagrant:

    $ vagrant box add archlinux-x86_64 archlinux-x86_64-virtualbox.box

## Configuration

You can configure each template to match your requirements by setting the following [user variables](https://packer.io/docs/templates/user-variables.html).

 User Variable       | Default Value | Description
---------------------|---------------|----------------------------------------------------------------------------------------
 `compression_level` | 6             | [Documentation](https://packer.io/docs/post-processors/vagrant.html#compression_level)
 `cpus`              | 1             | Number of CPUs
 `disk_size`         | 40000         | [Documentation](https://packer.io/docs/builders/virtualbox-iso.html#disk_size)
 `headless`          | 0             | [Documentation](https://packer.io/docs/builders/virtualbox-iso.html#headless)
 `memory`            | 512           | Memory size in MB
 `mirror`            |               | A URL of the mirror where the ISO image is available

### Example

Build an uncompressed Arch Linux vagrant box with a 4GB hard disk using the VirtualBox provider:

    $ packer build -only=virtualbox-iso -var compression_level=0 -var disk_size=4000 archlinux-x86_64.json

## Pre-built Boxes

You can also use the pre-built boxes hosted on [Atlas](https://atlas.hashicorp.com/kaorimatz).

    $ vagrant box add kaorimatz/archlinux-x86_64
