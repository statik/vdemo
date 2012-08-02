#
# Cookbook Name:: team-dashboard
# Recipe:: default
#
# Copyright 2012, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# create a 2.7 virtualenv owned by vagrant user
python_virtualenv "/home/vagrant/team_dashboard_venv" do
  owner "vagrant"
  group "vagrant"
  action :create
end

# install python packages into our virtualenv
python_pip "gunicorn" do
  virtualenv "/home/vagrant/team_dashboard_venv"
  action :install
end

packages = ["mercurial", "mtr", "sl", "byobu", "vim-nox"]

packages.each do |p|
 	package p
end

execute 'apt-get upgrade -y'
