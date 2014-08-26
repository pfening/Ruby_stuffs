#!/usr/bin/ruby

require 'gtk2'
require 'ldap'

fixed = Gtk::Fixed.new

input = Gtk::Entry.new
fixed.put input, 10, 10

button = Gtk::Button.new("Search")
fixed.put button, 170, 10
button.signal_connect("clicked") do
on_clicked(input)
end

$treeview = Gtk::TreeView.new
$treeview.selection.mode = Gtk::SELECTION_SINGLE

scrolled_win = Gtk::ScrolledWindow.new
scrolled_win.set_size_request(500, 150)
scrolled_win.add($treeview)
scrolled_win.set_policy(Gtk::POLICY_AUTOMATIC, Gtk::POLICY_AUTOMATIC)

fixed.put scrolled_win, 10, 50

SN=0;UID=1;MAIL=2

renderer = Gtk::CellRendererText.new
column   = Gtk::TreeViewColumn.new("Name", renderer, :text => SN)
$treeview.append_column(column)
column   = Gtk::TreeViewColumn.new("ID", renderer, :text => UID)
$treeview.append_column(column)
column   = Gtk::TreeViewColumn.new("Mail", renderer, :text => MAIL)
$treeview.append_column(column)


def on_clicked (sender)

$HOST =    'bluepages.ibm.com'
$PORT =    LDAP::LDAP_PORT
$SSLPORT = LDAP::LDAPS_PORT

base = 'ou=bluepages,o=ibm.com'
scope = LDAP::LDAP_SCOPE_SUBTREE
filter = "(sn=#{sender.text})"
attrs = ['cn', 'serialNumber','mail']

conn = LDAP::Conn.new($HOST, $PORT)
conn.bind('ou=bluepages,o=ibm.com')

$store = Gtk::ListStore.new(String,String,String)

conn.search(base, scope, filter, attrs) do  |entry|

iter = $store.append

$store.set_value(iter, SN,  "#{entry['cn'].at(0)}")
$store.set_value(iter, UID,  "#{entry['serialNumber']}")
$store.set_value(iter, MAIL,  "#{entry['mail'].at(0)}")

$treeview.model = $store
end

conn.unbind
end

window = Gtk::Window.new
window.signal_connect("destroy") do
Gtk.main_quit
end

window.set_title "BluePage Search"
window.set_default_size 520, 200
window.set_window_position Gtk::Window::POS_CENTER
window.border_width = 5
window.add(fixed)
window.show_all

Gtk.main
