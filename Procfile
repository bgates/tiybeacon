web: /bin/bash -c '(nohup ssh -n -i compose-heroku-key -o StrictHostKeyChecking=no \
-N compose@dblayer.com -p 1000 -L 127.0.0.1:28015:52.23.215.146:28015 &); bundle exec rails server -p $PORT'

