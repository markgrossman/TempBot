TempBot
=======

A Google Hangouts chat bot that returns temperature information from a ds18b20 temperature sensor connected to a raspberry pi...because who wouldn't want something like that.


##Setup

1. Run 'bundle install' 
1. Set the appropriate information in TempBot.rb.  


##TODO

 1. Have the bot send a message if the temperature changes more than a set amount.
 
##Known Issues
 1. Does not return anything if something other than 'temp' is sent to it
 2. Is currently case sensitive on 'temp'
