include Java

import javax.swing.JFrame


class Example < JFrame
  
    def initialize
        super "Simple"
        
        self.initUI
    end
      
    def initUI
        
        self.setSize 300, 200
        self.setDefaultCloseOperation JFrame::EXIT_ON_CLOSE
        self.setLocationRelativeTo nil
        self.setVisible true
    end
end

Example.new
