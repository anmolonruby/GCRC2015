# List all gems that are required.
require 'rubygems'
require 'bundler/setup'
require 'dino'

# Setup the hardware with their pins specified.
board = Dino::Board.new(Dino::TxRx::Serial.new)
sensor = Dino::Components::Sensor.new(pin: 'A0', board: board)
led = Dino::Components::Led.new(pin: 1, board: board)

# Initially set the led off.
led.send(:off)

# Puts the recieved data in terminal.
sensor.when_data_received do |data|
	puts data

	d = data.to_i 

	if d > 0
		led.send(:on) # Turn LED on if pressure sensor is pressed.
	elsif d == 0
		led.send(:off) # Turn LED off if pressure sensor is not pressed.
	end
end


sleep



