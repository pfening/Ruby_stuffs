require 'gtk2'

fixed = Gtk::Fixed.new

lab = Gtk::Label.new "..."
fixed.put lab, 40, 10

label = Gtk::Label.new "..."
fixed.put label, 40, 50

entry = Gtk::Entry.new
fixed.put entry, 40, 90
entry.set_text("barom")
entry.signal_connect "key-release-event" do |w, e|
on_key_release(w,e,label)
puts w
puts e
puts label
end

button = Gtk::Button.new("OK")
fixed.put button, 40, 130
button.signal_connect("clicked") do
on_clicked(entry, lab)
end

combo=Gtk::ComboBoxEntry.new
fixed.put combo, 40, 170
combo.signal_connect "changed" do |w|
on_changed(w, label)
end
combo.append_text 'Ubuntu'
combo.append_text 'Mandriva'
combo.append_text 'Redhat'
combo.append_text 'Gento'
combo.append_text 'Mint'

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
