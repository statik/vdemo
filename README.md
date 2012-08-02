Getting Started
===============

Install Vagrant
---------------
- First, install [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
- Second, install[Vagrant](http://downloads.vagrantup.com/)

Run Vagrant and download the base VM
------------------------------------
The first time you run Vagrant, it will need to download the base VM image,
which is a few hundred MB. Subsequent runs will not need to re-download the image.
To run Vagrant, type `vagrant up`. Get a cup of coffee, it will take a while to 
download the base image, import it to virtualbox, and then run chef-solo to
configure the machine as specified in the chef cookbooks.

SSH into the VM
---------------
By default, the VM runs without any GUI (also known as 'headless'). To access the VM, run `vagrant ssh` which will give you a shell on the VM.

> If you are running on a Windows host, note that Windows is
> generally not distributed with an SSH client by default.
> Vagrant will output SSH authentication info which you can
> use with your favorite SSH client, such as [PuTTY](http://www.chiark.greenend.org.uk/~sgtatham/putty/)
> For more information see the [Vagrant](http://vagrantup.com/v1/docs/getting-started/ssh.html) website.

Play with the code
------------------
The code in this branch is visible inside the VM! Just try `cd vagrant; ls`. Changes you make
inside the VM will be saved back to the host machine, and changes you make on the host machine
are immediately visible inside the VM.

Access a webserver you are running inside the VM
------------------------------------------------
From a browser running on your host machine, visit `http://192.168.33.10:NNNN` in order
to access a webserver running inside the VM. A simple test webserver can be run with
`python -m SimpleHTTPServer`

Turn off the VM to get your RAM back
------------------------------------
When you are done working, run `vagrant halt` to power down the VM and reclaim your ram.

Modify Chef cookbooks to adjust what is installed
-------------------------------------------------
Look at cookbooks/team-dashboard/recipes/default.rb and you can see how to
add python packages to the virtualenv using pip and how to install deb packages.

If you add a package to the chef cookbook and want to apply the change to your vm,
just run `vagrant provision`. It will only execute the commands necessary to bring
the VM in line with the modified cookbook, it won't re-run previous commands.

TODO: update this to include the apache2 cookbook with mod_wsgi configured to
run the django site, and example commands for reloading the site after .py changes
(or configure the autoreloader).
TODO: update this to include nodejs and examples of how to install npm packages into
a project folder.