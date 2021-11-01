dog = {}
dog.purchased = false
dog.name = "unknown"
dog.hunger = 30
dog.thirst = 30
dog.happiness = 50
dog.price = 300

dog.status = function()
	if self.purchased == false then
		print "you dont own a dog"
	else
		print "name: " + self.name
		print "hunger: " + self.hunger
		print "thirst: " + self.thirst
		print "happiness: " + self.happiness
	end if
end function

dog.petting = function()
	self.happiness = self.happiness +5
end function