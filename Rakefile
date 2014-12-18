
vagrant_plugins = { 'ansible' => '0.2.0' ,
                    'vagrant-cachier' => '1.1.0',
                    'vagrant-hostmanager' => '1.5.0',
                    'vagrant-triggers' => '0.4.3',
                    'vagrant-serverspec' => '0.1.0',
                    'vagrant-hostsupdater' => '0.0.11'}

ansible_roles = [
  'Azulinho.azulinho-google-dns',
  'Azulinho.azulinho-python27',
  'Azulinho.azulinho-jenkins-plugins',
  'Azulinho.azulinho-jenkins-server']

task :default => ['setup', 'vagrant_up'] do

end

desc "let me sort out all the goodies you may need"
task :setup do
  plugins_installed = `vagrant plugin list`
  vagrant_plugins.each_pair do |name, version|
    unless plugins_installed =~ /.*#{ name }.*#{version}.*/
      system("vagrant plugin install #{ name } --plugin-version #{ version }")
    end
  end
  system("cd vagrantbox && bundle install")
  ansible_roles.each do |role|
    unless Dir.exists?("vagrantbox/roles/#{role}")
      system("cd vagrantbox && ansible-galaxy install #{ role } -p ./roles --force ")
    end
  end
end

desc "power up the vagrant boxes"
task :vagrant_up do
  ['vagrantbox'].each do |box|
    system("cd vagrantbox && vagrant up #{ box } --no-provision")
  end
  system("cd vagrantbox && vagrant provision vagrantbox")
end

