redis-tb
========

Ready to use Redis Master/Slave configuration, managed by Vagrant

# Usage

```bash
git clone https://github.com/luca3m/redis-tb
cd redis-tb
vagrant up
./manage.rb setup
```

Every virtual machine runs a sentinel on port `26379` and a DB
on port `6379`. Node `192.68.57.2` aka `redis01` will be the initial master. 
Master name is `test`. Using `manage.rb` you can do failover and simulate node crash.
