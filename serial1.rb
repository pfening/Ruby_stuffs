require "serialport"

port_str = "/dev/ttyACM0" 
baud_rate = 9600
data_bits = 8
stop_bits = 1
parity = SerialPort::NONE

sp = SerialPort.new(port_str, baud_rate, data_bits, stop_bits, parity)

while true do
r = sp.readlines
e=r.map{ |arr| arr.to_f  }
puts e
end 
