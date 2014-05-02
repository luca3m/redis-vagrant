redis-tb
========

Ready to use Redis Master/Slave configuration, managed by Vagrant

# Usage

```bash
git clone https://github.com/luca3m/redis-tb
cd redis-tb
vagrant up
redis-cli -h 192.168.57.3 slaveof 192.168.57.2 6379
redis-cli -h 192.168.57.4 slaveof 192.168.57.2 6379
```

Every virtual machine runs a sentinel on port `26379` and a DB
on port `6379`. Node `192.68.57.2` aka `redis01` will be the initial master. 
Master name is `test`.
