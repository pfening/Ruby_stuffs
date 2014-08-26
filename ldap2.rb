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

valz = Array.new()
  conn.search(base, scope, filter, attrs) { |entry|
     valz=entry.to_hash.values.to_a
	puts "#{entry['mail'].at(0)}" 
	p valz
  }

conn.unbind
