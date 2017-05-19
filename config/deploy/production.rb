server '52.193.242.248', user: 'app', roles: %w{app db web}
set :ssh_options, keys: '/Users/hito/.ssh/id_rsa'
