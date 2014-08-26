require 'rubygems'
require 'net/ldap'


ldap = Net::LDAP.new
ldap.host = '9.57.182.78'
ldap.port = 389


Net::LDAP.open(:host => '9.57.182.78', :port => 389) do |ldap|

if ldap.bind
filter = Net::LDAP::Filter.eq("cn", "pfening*")
treebase = "ou=bluepages,o=ibm.com"
  ldap.search(:base => treebase, :filter => filter) do |entry|
  puts "SN: #{entry.cn}"
p ldap.get_operation_result
end
end
end
p ldap.get_operation_result

