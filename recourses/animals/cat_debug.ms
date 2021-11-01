cat = {}
cat.purchased = false
cat.name = "unknown"
cat.hunger = 20
cat.thirst = 20
cat.happiness = 50
cat.price = 950

cat.status = function()
	if self.purchased == false then
		print "you dont own a cat"
	else
		print "name: " + self.name
		print "hunger: " + self.hunger
		print "thirst: " + self.thirst
		print "happiness: " + self.happiness
	end if
end function

cat.petting = function()
	self.happiness = self.happiness +5
end function