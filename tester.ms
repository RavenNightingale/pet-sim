//====================
globals.funds = 1500
//==================== funds
env.importPaths.push "/usr/recourses/shop"

import "bird_food_debug"
import "cat_food_debug"
import "dog_food_debug"

birdF = new bird_food_debug.bird_food
catF = new cat_food_debug.cat_food
dogF = new dog_food_debug.dog_food
//==================== imports animal food data
shop = function(shop_input)
	if shop_input == "buy bird food" then
		birdF.stock = birdF.stock +10
	end if
	
	if shop_input == "buy cat food" then
		catF.stock = catF.stock +10
	end if
	
	if shop_input == "buy dog food" then
		dogF.stock = dogF.stock +10
	end if
end function
//==================== makes buy/sell possible
env.importPaths.push "/usr/recourses/animals"

import "dog_debug"
import "cat_debug"
import "bird_debug"

dog = new dog_debug.dog
cat = new cat_debug.cat
bird = new bird_debug.bird
//==================== imports dog, cat, bird data
wallet = function(wallet_input)
	if wallet_input == "funds" then
		print "you have $" + globals.funds
	end if
end function
//==================== wallet prints your current funds
globals.is_first_pet = true
//==================== first time pet owner set true
kennel = function(kennel_input)
	if kennel_input == "prices" then
		print "bird"
		print ""
		print "$" + bird.price
		print ""
		print "cat"
		print ""
		print "$" + cat.price
		print ""
		print "dog"
		print ""
		print "$" + dog.price	
	end if
	
	if kennel_input == "buy bird" and globals.funds <= bird.price then
		print "Not engough funds"
	else
		if globals.funds >= bird.price then
			globals.funds = globals.funds - bird.price
		end if
	end if
	
	if kennel_input == "buy dog" and globals.funds <= dog.price then
		print "Not engough funds"
	else
		if globals.is_first_pet == true then
			print "congratulations on your first pet!"
			globals.is_first_pet = false
		end if
		
		if globals.funds >= dog.price then
			globals.funds = globals.funds - dog.price
		end if
	end if
	
	if kennel_input == "buy cat" and globals.funds <= cat.price then
		print "Not engough funds"
	else
		if globals.is_first_pet == true then
			print "congratulations on your first pet!"
			globals.is_first_pet = false
		end if
		
		if globals.funds >= cat.price then
			globals.funds = globals.funds - cat.price
		end if
	end if	
end function
//==================== kennel compares price over funds and checks first time pet owner
while true
	inp = input("select: ")
	
	if inp == "status" then
		animal_status()
	end if
	
	if inp == "kennel" then
		kennel_input = input("kennel: ")
		kennel(kennel_input)
	end if
	
	if inp == "wallet" then
		wallet_input = input("wallet: ")
		wallet(wallet_input)
	end if
	
	if inp == "shop" then
		shop_input = input("shop: ")
		shop(shop_input)
	end if
	
	if inp == "inventory" then
		print "you have " + birdF.stock + " bird food"
	end if
end while
//==================== main user interface