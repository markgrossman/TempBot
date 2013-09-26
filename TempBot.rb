#!/usr/bin/ruby

require 'easy-gtalk-bot'
require 'fileutils'

TEMP_FILENAME = '/path/to/file/here'

bot = GTalk::Bot.new(:email => "<email>", :password => '<password>')
bot.get_online

puts 'Connected!'

def convert_to_fahrenheit(raw_temp)
  cel_temp = (raw_temp/1000)
  fahrenheit_temp = (cel_temp * 1.8) + 32.0
  return fahrenheit_temp
end

def read_temp(file_name)
  file = File.new(file_name)
  file.each do |line|
    if line['t=']
      start_pos = line.index('t=') + 2
      temp = line[start_pos..-1].to_f
      return convert_to_fahrenheit(temp).round(2)
    end
  end
end

bot.on_message do |from, text|
  if text == "temp" #TODO - Make this more robust
    temperature = read_temp(TEMP_FILENAME)
    bot.message from, "The temperature is: #{temperature}"
  end
end

Thread.stop