#  Vagrant Demo for Ansible (ad-hoc commands)

This demo setups up our vagrant environment so we can showcase the power of Ansible to run various ad-hoc commands and scripts.

=========================

Setup
--------
 1. Install Vagrant and Github.
 2. Clone this repo: https://github.com/opsmotion/ansible_demo.git - This will create an ansible_demo directory full of the code required for this piece of work.
 3. Cd into the ansible_demo firectory and run "vagrant up".
 4. once the Vagrant machines have been created, use vagrant ssh <servername> to access them.
 
 ````
[ansible_demo]# vagrant ssh master.example.com
Welcome to Ubuntu 14.04.5 LTS (GNU/Linux 3.13.0-125-generic x86_64)

 * Documentation:  https://help.ubuntu.com/

  System information as of Mon Mar 19 22:22:27 UTC 2018

  System load:  0.23              Processes:           92
  Usage of /:   3.6% of 39.34GB   Users logged in:     1
  Memory usage: 32%               IP address for eth0: 10.0.2.15
  Swap usage:   0%                IP address for eth1: 192.168.32.40

  => There is 1 zombie process.

  Graph this data and manage this system at:
    https://landscape.canonical.com/

  Get cloud support with Ubuntu Advantage Cloud Guest:
    http://www.ubuntu.com/business/services/cloud

New release '16.04.4 LTS' available.
Run 'do-release-upgrade' to upgrade to it.


Last login: Mon Mar 19 22:22:28 2018 from ansible03.example.com
vagrant@master:~$ 
 ````

Command examples
--------
 * To run ansible against just one host:
 ````
 vagrant@master:~$ ansible -i ansible01, all -m shell -a 'uptime' -k
SSH password: 
ansible01 | success | rc=0 >>
 22:39:47 up 21 min,  1 user,  load average: 0.00, 0.01, 0.05

vagrant@master:~$ 
````

 * To run ansible against a list of hosts, create a hosts file and call it like this:
 ````
 vagrant@master:~$ ansible -i list.dm all -m shell -a 'uptime' -k
SSH password: 
ansible03 | success | rc=0 >>
 22:39:14 up 18 min,  2 users,  load average: 0.00, 0.01, 0.05

ansible02 | success | rc=0 >>
 22:39:14 up 20 min,  1 user,  load average: 0.00, 0.01, 0.05

ansible01 | success | rc=0 >>
 22:39:14 up 20 min,  1 user,  load average: 0.00, 0.01, 0.05
ansible -i ansible01, all -m shell -a 'uptime' -k

vagrant@master:~$ ansible -i list.dm all -m shell -a 'hostname > /tmp/name.dm; cat /tmp/name.dm' -k
SSH password: 
ansible03 | success | rc=0 >>
master

ansible01 | success | rc=0 >>
ansible01

ansible02 | success | rc=0 >>
web01

vagrant@master:~$ ansible -i list.dm all -m shell -a 'service ssh status' -k
SSH password: 
ansible03 | success | rc=0 >>
ssh start/running, process 1506

ansible01 | success | rc=0 >>
ssh start/running, process 1501

ansible02 | success | rc=0 >>
ssh start/running, process 1785

 ````
