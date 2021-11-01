bird = {}
bird.purchased = false
bird.name = "unknown"
bird.hunger = 10
bird.thirst = 10
bird.happiness = 50
bird.price = 3500

bird.status = function()
	if self.purchased == false then
		print "you dont own a bird"
	else if self.purchased != false then
		print "name: " + self.name
		print "hunger: " + self.hunger
		print "thirst: " + self.thirst
		print "happiness: " + self.happiness
	end if
end function

bird.petting = function()
	self.happiness = self.happiness +5
end function