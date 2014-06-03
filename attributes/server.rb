default['rstudio-server']['version'] = "0.97.551"

case node['platform_family']
when 'rhel'
  if kernel['machine'] =~ /x86_64/
    default['rstudio-server']['binaryname'] = "rstudio-server-#{default['rstudio-server']['version']}-x86_64.rpm"
  else
    default['rstudio-server']['binaryname'] = "rstudio-server-#{default['rstudio-server']['version']}-i686.rpm"
  end
  default['rstudio-server']['url'] = "http://download2.rstudio.org/#{default['rstudio-server']['binaryname']}"

else
  default['rstudio-server']['url'] = nil

end

