require 'sqlite3'

begin
    
    db = SQLite3::Database.open "/home/gabor/.passstore/password.db"
    
    stm = db.prepare "SELECT * FROM list" 
    rs = stm.execute 
    
    rs.each do |row|
        p row[3]
    end
           
rescue SQLite3::Exception => e 
    
    puts "Exception occured"
    puts e
    
ensure
    stm.close if stm
    db.close if db
end
