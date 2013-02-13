#
# Cookbook:: Bash
# Recipe:: rcfiles
# Author:: Jesse Nelson <spheromak@gmail.com>
#

template "/etc/profile.d/global-bash.sh" do 
  owner "root"
  group "root"
  mode  0755
end

cookbook_file "/etc/DIR_COLORS" do 
  owner "root"
  group "root"
  mode  0644
end

cookbook_file "/etc/skel/.bashrc" do 
  source "skel-bashrc"
  owner "root"
  group "root"
  mode 0644
end

cookbook_file "/etc/skel/.bash_profile" do 
  source "skel-bash_profile"
  owner "root"
  group "root"
  mode 0644
end

cookbook_file "/etc/skel/.bash_logout" do 
  source "skel-bash_logout"
  owner "root"
  group "root"
  mode 0644
end

if node[:platform_family] == "debian"
  package "curl"

  # we touch bash_profile for root so that we ignore the ubuntu bashrc placed there
  # by default
  file "/root/.bash_proflie" do
    action :create_if_missing
    content "# overides ~/.bashrc on ubuntu"
    owner "root"
    group "root"
    mode 0644
  end
end
