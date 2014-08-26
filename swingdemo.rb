require 'java' # Line 2  
JFrame = javax.swing.JFrame  
JLabel = javax.swing.JLabel  
frame  = JFrame.new  
frame.setSize 300, 200
jlabel = JLabel.new("Hello World")  
frame.add(jlabel)  
frame.setDefaultCloseOperation(JFrame::EXIT_ON_CLOSE)  
frame.pack  
frame.setVisible(true)  
