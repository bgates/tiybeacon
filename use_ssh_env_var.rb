require 'tempfile'
file = Tempfile.new('pem')
begin
  file.write(ENV['RETHINKDB_SSH'])
  puts 'file was written'
  Dir.mkdir("./.ssh")
  hosts = File.new("./.ssh/known_hosts") do
  hosts << "ec2-52-23-215-146.compute-1.amazonaws.com,52.23.215.146 ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDAPOYlX3f1fsnYAmYJSPPwJIHHyrkVqSR9tfhKiF1SnrEacPdLGKfPQhJBrB1L4j1HHCuHJoeWQZ1uH5GV942LRQT/HZ3mOBLy6CnRRDAa4dLl+1+ILzNp90pEKo2jIbjea8Iqp2JlzX6zmqO8oMJrls7qr6zLccdHvXzIrtAmCnPgc20O5Uni4B0UraXNLBBsL7ddnxadf7xPk/dKhxC1c6KCAATrQlAsROy/5Yw3msBzkf0IttSB9vTH2PQRZjfNTH/wn/7NLMdYZ3YaaN7nQ4nrCZ3LqG2dm3WB/8xCXSb21v3Y2kCMyFL7CjlBlUyRzxOMMhG3Vm6pw/5dRsU/"
  end
  `nohup ssh -n -i #{file.path} -o StrictHostKeyChecking=no -N ubuntu@#{ENV['AWS_DNS']} -p 1000 -L 127.0.0.1:28015:#{ENV['AWS_IP']}:28015`
  puts 'please'
ensure
  file.close
  file.unlink
end
