include Java

import java.awt.Dimension
import java.awt.Color
import javax.swing.JButton
import javax.swing.SwingConstants
import javax.swing.JFrame
import javax.swing.JLabel
import javax.swing.JTextArea
import javax.swing.BorderFactory
import javax.swing.GroupLayout


class Example < JFrame
  
  def initialize
      super "Windows"
      
      self.initUI
  end
    
  def initUI
    
      layout = GroupLayout.new self.getContentPane
      self.getContentPane.setLayout layout
      layout.setAutoCreateGaps true
      layout.setAutoCreateContainerGaps true

      self.setPreferredSize Dimension.new 350, 300

      windows = JLabel.new "Windows"
      area = JTextArea.new 
      area.setEditable false
      area.setBorder BorderFactory.createLineBorder Color.gray
      activateButton = JButton.new "Activate"
      closeButton = JButton.new "Close"
      helpButton = JButton.new "Help"
      okButton = JButton.new "OK"
       
      
      sg = layout.createSequentialGroup
      pg1 = layout.createParallelGroup
      pg2 = layout.createParallelGroup
      pg1.addComponent windows
      pg1.addComponent area
      pg1.addComponent helpButton
      sg.addGroup pg1
      pg2.addComponent activateButton
      pg2.addComponent closeButton      
      pg2.addComponent okButton
      sg.addGroup pg2
      layout.setHorizontalGroup sg
      
      sg1 = layout.createSequentialGroup
      sg2 = layout.createSequentialGroup
      pg1 = layout.createParallelGroup
      pg2 = layout.createParallelGroup      
      sg1.addComponent windows
      pg1.addComponent area
      sg2.addComponent activateButton
      sg2.addComponent closeButton
      pg1.addGroup sg2
      sg1.addGroup pg1
      pg2.addComponent helpButton
      pg2.addComponent okButton
      sg1.addGroup pg2
      layout.setVerticalGroup sg1
      

      layout.linkSize SwingConstants::HORIZONTAL, 
          okButton, helpButton, closeButton, activateButton

      self.pack
    
      self.setDefaultCloseOperation JFrame::EXIT_ON_CLOSE
      self.setLocationRelativeTo nil
      self.setVisible true
  end
  
end

Example.new
