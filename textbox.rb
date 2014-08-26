require 'tk'

root = TkRoot.new
root.title = "Window"

def myproc
  puts current_value
end

entry1 = TkEntry.new(root)do 
grid('row'=>0, 'column'=>0)
end


btn_OK = TkButton.new(root) do
  text "OK"
  state "normal"
  command (proc {myproc})
  grid('row'=>0, 'column'=>1)
end

current_value = entry1.value

Tk.mainloop

