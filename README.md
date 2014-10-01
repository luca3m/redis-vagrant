redis-vagrant
========

Ready to use Redis Master/Slave and cluster configuration, managed by Vagrant. It requires Vagrant 1.6+.

# Usage

```bash
git clone https://github.com/luca3m/redis-tb
cd redis-tb
vagrant up
./manage.rb setup
```

# Info

Every virtual machine runs a sentinel on port `26379` and a DB
on port `6379`. Node `192.68.57.2` aka `redis01` will be the initial master. 
Master name is `test`. Using `manage.rb` you can do failover and simulate node crash.

On ports `7000` and `7001` there are redis-cluster enabled instances. They can be set up using `redis-trib` utility from redis source code.
