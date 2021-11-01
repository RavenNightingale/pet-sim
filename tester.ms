//====================
funds = 5000
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
is_first_pet = true
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
	
	if kennel_input == "buy bird" then
		if globals.funds <= bird.price then
			print "not enough funds"
		else
			if globals.funds == bird.price or globals.funds >= bird.price then
				globals.funds = globals.funds -bird.price
				bird.purchased = true
			end if
		end if
	end if
	
	if kennel_input == "buy dog" then
		if globals.funds <= dog.price then
			print "not enough funds"
		else
			if globals.funds == dog.price or globals.funds >= dog.price then
				globals.funds = globals.funds -dog.price
				dog.purchased = true
				if globals.is_first_pet == true then
					print"congratulations on buying your first pet!"
				end if
			end if
		end if
	end if
	
	if kennel_input == "buy cat" then
		if globals.funds <= cat.price then
			print "not enough funds"
		else
			if globals.funds == cat.price or globals.funds >= cat.price then
				globals.funds = globals.funds -cat.price
				cat.purchased = true
				if globals.is_first_pet == true then
					print"congratulations on buying your first pet!"
				end if
			end if
		end if
	end if
end function
//==================== kennel compares price over funds and checks first time pet owner
while true
	print "use 'help' for help."
	inp = input("select: ")
	
	if inp == "help" then
		print "use 'status' to check pet status"
		print "use 'kennel' to go to the pet store"
		print "use 'shop' to go to the store"
		print "use 'wallet' to open your wallet"
		print "use 'inventory' to open your inventory"
		print "use 'pet' then 'animal' to interact with your pet"
	end if
	
	if inp == "status" then
		cat.status()
		bird.status()
		dog.status()
	end if
	
	if inp == "kennel" then
		print "use 'buy' then 'animal' to purchase a pet"
		kennel_input = input("kennel: ")
		kennel(kennel_input)
	end if
	
	if inp == "wallet" then
		print "use 'funds' to check your cash"
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
	
	if inp == "pet bird" then
		if bird.purchased == false then
			print "you dont own a bird to pet"
		else
			print bird.name + " is slightly happier"
			bird.petting()
		end if
	end if
end while
//==================== main user interface