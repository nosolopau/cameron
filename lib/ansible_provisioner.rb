class AnsibleProvisioner
  attr_accessor :server

  def initialize(server)
    self.server = server
  end

  def provision
    raise 'Server inactive' unless self.server.accessible?

    self.generate_hosts
    self.generate_playbook
    self.run_ansible
  end

  def run_ansible
    command = "ansible-playbook -i #{dir}/#{hosts_file_name} #{dir}/#{playbook_file_name} --private-key=config/keys/id_rsa -vvvv"
    logger.info command
    puts command

    `#{command}`
  end

  def generate_hosts
    content = "[#{self.server.system_id}]\n#{self.server.ip_address}\n"

    File.open(File.join(self.dir, self.hosts_file_name), 'w+') do |f|
      f.write(content)
    end
  end

  def generate_playbook
    content = [
        'hosts' => self.server.system_id,
        'user'  => self.server.user,
        'roles' => ['base'] + self.server.roles.map(&:name)
    ].to_yaml

    File.open(File.join(self.dir, self.playbook_file_name), 'w+') do |f|
      f.write(content)
    end
  end

  protected

  def logger
    Rails.logger
  end

  def playbook_file_name
    "#{self.server.system_id}_playbook.yml"
  end

  def hosts_file_name
    "#{self.server.system_id}_hosts"
  end

  def dir
    'ansible'
  end
end