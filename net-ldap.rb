require 'rubygems'
require 'net/ldap'

ldap = Net::LDAP.new
ldap.host = '9.57.182.78'
ldap.port = 389

base = "ou=bluepages,o=ibm.com"

if ldap.bind
 puts "authentication succeeded"
filter = Net::LDAP::Filter.eq('objectclass', '*')
  ldap.search(:base => base, :filter => filter) do |object|
    puts "dn: #{object.dn}"
  end	
else
  puts "authentication failed"
end

p ldap.get_operation_result
