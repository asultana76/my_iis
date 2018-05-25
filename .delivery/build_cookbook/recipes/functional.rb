#
# Cookbook:: build_cookbook
# Recipe:: functional
#
# Copyright:: 2017, The Authors, All Rights Reserved.
include_recipe 'delivery-truck::functional'

# Run it only in Delivered::Functional
#
# This helper is coming from delivery-sugar
# => https://github.com/chef-cookbooks/delivery-sugar/blob/master/libraries/delivery_dsl.rb#L105,L113
if delivery_environment.eql?('delivered')
    
      # Previously generated knife.rb files
      lab_knife_rb = '/var/opt/delivery/workspace/chef_servers/lab/knife.rb'
     
      # ChefServer Objects
      chef_server_lab = DeliverySugar::ChefServer.new(lab_knife_rb) 
      
      delivery_chef_cookbook delivery_project do
        path delivery_workspace_repo
        chef_server [chef_server_lab]
      end
    end
