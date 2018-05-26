#
# Cookbook:: my_iis
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
include_recipe 'windows::default'
 
%w{ IIS-WebServerRole IIS-WebServer }.each do |feature|
  windows_feature feature do
    action :install
  end
end

service 'W3SVC' do
  action [:start, :enable]
end

file 'c:\inetpub\wwwroot\Default.html' do
  content 'Hello world! Authored by Jane Doe'
end

windows_zipfile 'C:\temp\my_iis.zip' do
  source 'c:\my_iis'
  action :zip
end

execute 'Backup my_iis' do
  dir_name = Chef::Config[:file_cache_path]
  cwd "#{dir_name}\\cookbooks"
  command "tar -zcvf c:\\temp\\my_iis.tgz my_iis"
end