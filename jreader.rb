require "java"
 include_class "java.io.BufferedReader"
 include_class "java.io.FileReader"
 fileReader = FileReader.new "/home/gabor/org.txt"
 bufferReader = BufferedReader.new fileReader
 str = bufferReader.readLine
 while str
 puts str.to_s
 str = bufferReader.readLine
 end
