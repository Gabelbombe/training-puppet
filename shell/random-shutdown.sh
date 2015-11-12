#!/bin/bash
#sudo -i -u peadmin /bin/bash ## dropshell

admin="${1}"    ## puppet-admin: peadmin
safe="${2}"     ## dont kill youirself!!!

## pick a random user from the pool
users=$(mco ping |awk '{print$1}' |awk -F'.' '{print$1}' |grep '[A-Za-z]')

## get user count so we can pop one at random....
count=$(echo "$users" |wc -l)

while (true) ; do
  rand=$(( ( RANDOM % $count ) + 1 ))
  [ $users[$rand] != $safe ] && {
    sudo -i -u "${admin}" mco puppet disable -I $users[$rand].puppetlabs.vm       # disable puppet...
    sudo -i -u "${admin}" mco service sshd stop -I $users[$rand].puppetlabs.vm    # then shut off their ssh =)
    service mcollective stop                                                      # killshot
  }

  sleep $(( ( RANDOM % 30 )  + 1 )) ## sleep for a random amount of time....
done