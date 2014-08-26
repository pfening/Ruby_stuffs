require 'gtk2'
require 'sqlite3'

fixed = Gtk::Fixed.new

label = Gtk::Label.new "..."
fixed.put label, 10, 90

entry = Gtk::Entry.new
fixed.put entry, 10, 10
entry.set_text("barom")
entry.signal_connect "key-release-event" do |w, e|
on_key_release(w,e,label)
end

button = Gtk::Button.new("OK")
fixed.put button, 170, 10
button.signal_connect("clicked") do
on_clicked(entry, label)
end

combo=Gtk::ComboBoxEntry.new
fixed.put combo, 10, 50
combo.signal_connect "changed" do |w|
on_changed(w, label)
end

    db = SQLite3::Database.open "/home/gabor/test.db"    
    stm = db.prepare "SELECT * FROM test" 
    rs = stm.execute 
    
    rs.each do |row|
        combo.append_text row[0]
    end

treeview = Gtk::TreeView.new

scrolled_win = Gtk::ScrolledWindow.new
scrolled_win.set_size_request(150, 200)
scrolled_win.add(treeview)
scrolled_win.set_policy(Gtk::POLICY_AUTOMATIC, Gtk::POLICY_AUTOMATIC)

fixed.put scrolled_win, 10, 130

NAME=0
PLACE=1
AGE=2

renderer = Gtk::CellRendererText.new
column   = Gtk::TreeViewColumn.new("Name", renderer, :text => NAME)
treeview.append_column(column)
column   = Gtk::TreeViewColumn.new("Place", renderer, :text => PLACE)
treeview.append_column(column)
column   = Gtk::TreeViewColumn.new("Age", renderer, :text => AGE)
treeview.append_column(column)

class Items
  attr_accessor :name, :place, :age
  def initialize(n, p, a); @name, @place, @age = n, p, a; end
end

list = Array.new
list[0] = Items.new("gabor","ozd",36) 
list[1] = Items.new("ola","tychy",33)
list[2] = Items.new("alex","brno",2)


store = Gtk::ListStore.new(String,String,Integer)

list.each_with_index do |e, i|
  iter = store.append

  iter[NAME]   = list[i].name
  iter[PLACE] = list[i].place
  iter[AGE]  = list[i].age
end

treeview.model = store


def on_key_release sender, event, label
label.set_text sender.text
end

def on_clicked sender, label
label.set_text sender.text
end

def on_changed sender, label
label.set_text sender.active_text
end

window = Gtk::Window.new
window.signal_connect("destroy") do
Gtk.main_quit
end

window.set_title "GTK Test"
window.set_default_size 250, 250
window.set_window_position Gtk::Window::POS_CENTER
window.border_width = 5
window.add(fixed)
window.show_all

Gtk.main
