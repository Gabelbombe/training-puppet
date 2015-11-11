#!/usr/bin/ruby -w
module Puppet::Parser::Functions
  newfunction(
    :homedir,
    :doc      => "Returns the conventional Linux home directory of a username.",
    :type     => :rvalue,
    :arity    => 1
  ) do | args |

  user = args[0] ; raise ArgumentError, "Expects a string" unless user.class == String

    # shows all users on the system, will run again per user called in homedir.pp
    #    users = `cat /etc/passwd |grep '/home'`
    #    users.split("\n").select { | user |
    #        puts "-> #{user.split(':')[0]}"
    #    }

    case user
        when 'root' '/root'
        else "/home/#{user}"
        end
    end
end