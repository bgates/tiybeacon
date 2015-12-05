# README

I am using RethinkDB hosted on AWS, but my app server is hosted by Heroku.

In order to get the app to talk to the db, I have to ssh in. That requires a private
key, which I don't want to store in a repo, so I use

```
$ ruby set_ssh_env_var.rb
```
on localhost to set up relevant environment variables, then the Procfile runs `use_ssh_ev_var.rb`.
