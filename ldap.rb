require 'ldap'

$HOST =    'bluepages.ibm.com'
$PORT =    LDAP::LDAP_PORT
$SSLPORT = LDAP::LDAPS_PORT

base = 'ou=bluepages,o=ibm.com'
scope = LDAP::LDAP_SCOPE_SUBTREE
filter = '(sn=pfening)'
attrs = ['cn', 'serialNumber','mail']

conn = LDAP::Conn.new($HOST, $PORT)
conn.bind('ou=bluepages,o=ibm.com')

conn.perror("bind")
begin
  conn.search(base, scope, filter, attrs) { |entry|
	puts "#{entry['cn']}"
	puts "#{entry['serialNumber']}"
	puts "#{entry['mail']}"
  }
rescue LDAP::ResultError
  conn.perror("search")
  exit
end
conn.perror("search")
conn.unbind
