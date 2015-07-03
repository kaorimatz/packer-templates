# packer-templates

[![Travis](https://img.shields.io/travis/kaorimatz/packer-templates.svg)](https://travis-ci.org/kaorimatz/packer-templates)

Templates for [Packer](http://www.packer.io/)

## Usage

Clone the repository:

    $ git clone https://github.com/kaorimatz/packer-templates && cd packer-templates

Build a machine image from the template in the repository:

    $ packer build fedora-20-x86_64.json

## Configuration

You can configure each template to match your requirements by setting the following [user variables](https://packer.io/docs/templates/user-variables.html).

 User Variable      | Default Value | Description
--------------------|---------------|----------------------------------------------------------------------------------------
 `compressin_level` | 6             | [Documentation](https://packer.io/docs/post-processors/vagrant.html#compression_level)
 `cpus`             | 1             | Number of CPUs
 `disk_size`        | 40000         | [Documentation](https://packer.io/docs/builders/virtualbox-iso.html#disk_size)
 `headless`         | 0             | [Documentation](https://packer.io/docs/builders/virtualbox-iso.html#headless)
 `memory`           | 512           | Memory size in MB
 `mirror`           |               | A URL of the mirror where the ISO image is available

### Example

Build an uncompressed Fedora 22 vagrant box with a 4GB hard disk:

    $ packer build -var compression_level=0 -var disk_size=4000 fedora-22-x86_64.json
