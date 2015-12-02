require 'tempfile'
file = Tempfile.new('pem')
begin
  file.write(ENV['RETHINKDB_SSH'])
  puts 'file was written'
  `nohup ssh -n -i #{file.path} -o StrictHostKeyChecking=no -N ubuntu@#{ENV['AWS_DNS']} -p 1000 -L 127.0.0.1:28015:#{ENV['AWS_IP']}:28015`
  puts 'please'
ensure
  file.close
  file.unlink
end
