#
# Cookbook Name:: rstudio
# Recipe:: default
#
# Copyright 2014, Takeshi Mikami
#
# All rights reserved - Do Not Redistribute
#
url = node['rstudio-server']['url']
download_path = "#{Chef::Config[:file_cache_path]}/#{node['rstudio-server']['binaryname']}"

include_recipe "yum-epel"

%w{R openssl098e compat-libgfortran-41}.each do |pkg|
  package pkg do
    action :install
  end
end

if url != nil
  # download
  Chef::Log.debug "download from rstudio.org"
  bash "download" do
    code <<-EOH
      curl -L #{url} -o #{download_path}
    EOH
    not_if "test -f #{download_path}"
  end

  # rpm install
  rpm_package "rstudio-server" do
    action :install
    source download_path
  end
  bash "rstudio-server verify-installation" do
    code "/usr/sbin/rstudio-server verify-installation"
  end
  
  # start service
  service 'rstudio-server' do
    supports :status => true, :restart => true, :reload => true
    action [ :enable, :start ]
  end

else
  Chef::Log.error "Unsupported platform"

end