require 'gtk2'

# Add three columns to the GtkTreeView. All three of the
# columns will be displayed as text, although one is a boolean
# value and another is an integer.
def setup_tree_view(treeview)
  # Create a new GtkCellRendererText, add it to the tree
  # view column and append the column to the tree view.
  renderer = Gtk::CellRendererText.new

  # render's propery will effect entire column
  renderer.foreground = "#ff0000"
  column   = Gtk::TreeViewColumn.new("Buy", renderer,  :text => BUY_IT)
  treeview.append_column(column)
  renderer = Gtk::CellRendererText.new
  column   = Gtk::TreeViewColumn.new("Count", renderer, :text => QUANTITY)
  treeview.append_column(column)
  renderer = Gtk::CellRendererText.new
  renderer = Gtk::CellRendererText.new
  column   = Gtk::TreeViewColumn.new("Product", renderer, :text => PRODUCT)
  treeview.append_column(column)
end

window = Gtk::Window.new("Grocery List")
window.resizable = true
window.border_width = 10

window.signal_connect('destroy') { Gtk.main_quit }
window.set_size_request(250, 165)

class GroceryItem
  attr_accessor :buy, :quantity, :product
  def initialize(b, q, p); @buy, @quantity, @product = b, q, p; end
end
BUY_IT = 0; QUANTITY = 1; PRODUCT  = 2

list = Array.new
list[0] = GroceryItem.new(true,  1, "Paper Towels") 
list[1] = GroceryItem.new(true,  2, "Bread")
list[2] = GroceryItem.new(false, 1, "Butter")
list[3] = GroceryItem.new(true,  1, "Milk")
list[4] = GroceryItem.new(false, 3, "Chips")
list[5] = GroceryItem.new(true,  4, "Soda") 

treeview = Gtk::TreeView.new
setup_tree_view(treeview)

# Create a new tree model with three columns, as Boolean,
# integer and string.
store = Gtk::ListStore.new(TrueClass, Integer, String)

# Add all of the products to the GtkListStore.
list.each_with_index do |e, i|
  iter = store.append

  iter[BUY_IT]   = list[i].buy       # same as: >>> # store.set_value(iter, BUY_IT,   list[i].buy)
  iter[QUANTITY] = list[i].quantity  # same as: >>> # store.set_value(iter, QUANTITY, list[i].quantity)
  iter[PRODUCT]  = list[i].product   # same as: >>> # store.set_value(iter, PRODUCT,  list[i].product)
end

# Add the tree model to the tree view
treeview.model = store

scrolled_win = Gtk::ScrolledWindow.new
scrolled_win.add(treeview)
scrolled_win.set_policy(Gtk::POLICY_AUTOMATIC, Gtk::POLICY_AUTOMATIC)

window.add(scrolled_win)
window.show_all
Gtk.main
