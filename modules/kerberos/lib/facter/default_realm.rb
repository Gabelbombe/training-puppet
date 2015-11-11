#!/usr/bin/ruby -w
require 'augeas'
Facter.add("default_realm") do
  setcode("/bin/awk '/default_realm/{print $NF}' /etc/krb5.conf")
end

Augeas::open do | aug |
  aug.get('/files/etc/krb5.conf/libdefaults/default_realm')
end