#
# Cookbook Name:: bitlbee-latest
# Recipe:: default
#
# Copyright (C) 2014 Matt Chun-Lum
#
# All rights reserved - Do Not Redistribute
#

# the apt cookbook currently doesn't support installing the key they way I
# need to for this recipie

include_recipe 'apt'

# create the sources list file
template '/etc/apt/sources.list.d/bitlbee.list' do
  owner 'root'
  group 'root'
  mode  0664
  variables({
    source: node['bitlbee']['source']
  })
  action :create_if_missing
  notifies :run, 'execute[add-bitlbee-gpg-key]', :immediate
end

# add the key
execute 'add-bitlbee-gpg-key' do
  command <<-EOF
sudo apt-key add - << EOL
#{node['bitlbee']['gpg_key']}
EOL
  EOF
  action :nothing
  notifies :run, 'execute[apt-get update]', :immediate
end

# install bitlbee
package 'bitlbee' do
  action :upgrade
end
