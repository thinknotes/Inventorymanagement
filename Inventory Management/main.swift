//
//  main.swift
//  Inventory Management
//
//  Created by StudentAM on 1/12/24.
//

import Foundation


//MARK: Item Prices
//Item Prices
let cerealsprice: Double = 4.99
let milkprice: Double = 4.99
let syrupprice: Double = 3.99
let cupsprice: Double = 2.99


//MARK: Item Quanity In Stock
//Item Quanity In Stock
//Sets default stock items to 100

var  cerealStockQuan: Int = 100
var  milkStockQuan: Int = 100
var  syrupStockQuan: Int = 100
var  cupsStockQuan: Int = 100
//Tell the user when the stock was last updated
let  stockUpdateDate: Date = .distantPast

//MARK: User Cart
//User Cart
//Set cart and totalSales to zero
var userCart: Double = 0.0
var numberOfItemsUserBought: Double = 0.0
var totalSales: Double = 0.0

//Keep track of how many items the user bought
var numberOfCeralBought: Int = 0
var numberOfMilksBought: Int = 0
var numberOfSyrupBought: Int = 0
var numberOfCupsBought: Int = 0


//MARK: Admin
//Admin
let AdminId: Int = 33039
//Shows today daete on Admin screen
let todayDate: Date = .distantPast

//MARK: For While Loop
//For While Loop
var optionsSelected = 0


while optionsSelected != 5  { //Only give 4 options for the user to choose from. If they type in 5 it will show them an erorr.
    menuDisplay() //Shows main menu on boot up
    if let userInput = readLine(), let selectedOption = Int(userInput) {
        
        //Tells the while loop what number the user selected
        optionsSelected = selectedOption
        
        if optionsSelected == 1 {
            addToCartMenu() //Shows add to cart menu
            
            //Add to cart option
            if let userInput = readLine() {
                if userInput == "1" {
                    addToCart(userInputString: "userInputString", userInput: Int(userInput)!, itemName: "Cereal", itemPrice: cerealsprice)
                    //Add item name and user quanity to cart
                    print("")
                    print("")
                   
                    
                } else if userInput == "2" {
                    addToCart(userInputString: "userInputString", userInput: Int(userInput)!, itemName: "Milk", itemPrice: milkprice)
                    //Add item name and user quanity to cart
                    print("")
                    print("")
                   
                } else if userInput == "3" {
                    addToCart(userInputString: "userInputString", userInput: Int(userInput)!, itemName: "Syrup", itemPrice: syrupprice)
                    //Add item name and user quanity to cart
                    print("")
                    print("")
                    
                } else if userInput == "4" {
                    addToCart(userInputString: "userInputString", userInput: Int(userInput)!, itemName: "Cups", itemPrice: cupsprice)
                    //Add item name and user quanity to cart
                    print("")
                    print("")
                  
                } else {
                    //If wrong option is inputed
                    print("Option Not Found")
                    
                }
                
                
            }
            
        }
        
        //Remove from cart option
        if optionsSelected == 2 {
            print("What item would you like to  remove from your cart? (Enter number of selection)")
            print("1.Cereal")
            print("2.Milk")
            print("3.Syrup")
            print("4.Cups")
            
            if let userInput = readLine() {
                if userInput == "1" {
                    removeItemFromCart(userInput: Int(userInput)!, itemName: "Cereal")
                    //Remove item name and user quanity fom cart
                }
                
                
                if userInput == "2" {
                    removeItemFromCart(userInput: Int(userInput)!, itemName: "Milk")
                    //Remove item name and user quanity fom cart
                }
                
                if userInput == "3" {
                    removeItemFromCart(userInput: Int(userInput)!, itemName: "Syrup")
                    //Remove item name and user quanity fom cart
                }
                
                if userInput == "4" {
                    removeItemFromCart(userInput: Int(userInput)!, itemName: "Cups")
                    //Remove item name and user quanity fom cart
                }
                
                
            }
        }
        
    
        if optionsSelected == 3 {
           CheckStock() //Shows Check stock screen
        }
        
        if optionsSelected == 4 {
            Admin() //Shows Admin screen
        }
        
        if optionsSelected == 5 {
            checkoutScreen() //Shows checkout screen
        }
        
    }
}
    
 //MARK: Remove Item From Cart
func removeItemFromCart(userInput: Int, itemName: String) {
    print("How many \(itemName)s would like to remove from your cart")
    if let userInputString = readLine(), let userInput = Int(userInputString) {
        //Check item name and and runs code
        if itemName == "Cereal" {
            //If user does not have enough items in cart and removes too many wil alert the user. else removes the quanity from cart and resest to zero
            if userInput > numberOfCeralBought {
                print("You dont have \(userInput) Cereal in your cart. You removed \(numberOfCeralBought)")
                numberOfCeralBought -= numberOfCeralBought
                userCart = 0
            } else {
                numberOfCeralBought -= userInput
                cerealStockQuan += userInput
                userCart -= Double(userInput) * cerealsprice
                print("You now have 0 Cereal in your cart.")
                print("You have removed \(userInput) \(itemName) from your cart!")
            }
        } else if itemName == "Milk" {
            if userInput > numberOfMilksBought {
                print("You dont have \(userInput) Milk in your cart. Please try a lower number or add more Milk to your cart")
                numberOfMilksBought -= numberOfMilksBought
                userCart = 0
            } else {
                numberOfMilksBought -= userInput
                milkStockQuan += userInput
                userCart -= Double(userInput) * milkprice
                print("You now have 0 Milk in your cart.")
                print("You have removed \(userInput) \(itemName) from your cart!")
            }
        
            
        } else if itemName == "Syrup" {
            if userInput > numberOfSyrupBought{
                print("You dont have \(userInput) Syrup in your cart. Please try a lower number or add more Syrup to your cart")
                numberOfSyrupBought = 0
                userCart = 0
            } else {
                numberOfSyrupBought -= userInput
                syrupStockQuan += userInput
                userCart -= Double(userInput) * syrupprice
                print("You now have 0 Syrup in your cart.")
                print("You have removed \(userInput) \(itemName) from your cart!")
            }
            
        } else if itemName == "Cups" {
            if userInput > numberOfCupsBought {
                print("You dont have \(userInput) Cups in your cart. Please try a lower number or add more Cups to your cart")
                numberOfCupsBought = 0
                userCart = 0
            } else {
                numberOfCupsBought -= userInput
                cupsStockQuan += userInput
                userCart -= Double(userInput) * cupsprice
                print("You now have 0 Cups in your cart.")
                print("You have removed \(userInput) \(itemName) from your cart!")
            }
        }
    
    } else {
        //Will give error if input is not number
        print("Invalid input. Please enter a valid number")
    }
}


//MARK: Add To Cart
//The add to cart takes in input string, input, itemName, itemPirce
func addToCart(userInputString: String, userInput: Int, itemName: String, itemPrice: Double) {
    print("How many \(itemName)s would like to add to your cart")
    if let userInputString = readLine(), let userInput = Double(userInputString) {
        print("You have added \(userInput) \(itemName) to your cart!")
        //Takes the how much the user enters times it by item price
        let total = userInput * itemPrice
        //Format the total to make the price readable
        let formattedTotal = String(format: "%.2f", total)
        userCart += total
        totalSales += total
        
        //Check what item you want and updates the stock qaun by lowering the number to what you bought and saving how much you bought to a variable which is used in summary.
        if itemName == "Cereal" {
            numberOfCeralBought += Int(userInput)
            cerealStockQuan -= Int(userInput)
            //Check to make sure item is in stock
            if Int(userInput) > cerealStockQuan {
                print("The item your trying to buy - Cereal is not in stock. Pls try a lower quanity or check another store. ")
            } else {
                //One it done checking it will print out the total
                print("Current total: $\(formattedTotal)")
            }
            
            
        }
        
        if itemName == "Milk" {
            numberOfMilksBought += Int(userInput)
            milkStockQuan -= Int(userInput)
            //Check to make sure item is in stock
            if Int(userInput) > milkStockQuan {
                print("The item your trying to buy - Milk is not in stock. Pls try a lower quanity or check another store. ")
            } else {
                //One it done checking it will print out the total
                print("Current total: $\(formattedTotal)")
            }
        }
        
        if itemName == "Syrup" {
            numberOfSyrupBought += Int(userInput)
            syrupStockQuan -= Int(userInput)
            //Check to make sure item is in stock
            if Int(userInput) > syrupStockQuan {
                print("The item your trying to buy - Syrup is not in stock. Pls try a lower quanity or check another store. ")
            } else {
                //One it done checking it will print out the total
                print("Current total: $\(formattedTotal)")
            }
        }
        
        if itemName == "Cups" {
            numberOfCupsBought += Int(userInput)
            cupsStockQuan -= Int(userInput)
            //Check to make sure item is in stock
            if Int(userInput) > cupsStockQuan{
                print("The item your trying to buy - Cups is not in stock. Pls try a lower quanity or check another store. ")
            } else {
                //One it done checking it will print out the total
                print("Current total: $\(formattedTotal)")
            }
        }
        
    } else {
        print("Invalid input. Please enter a valid number")
    }
    
    
}


//MARK: Update Restock
func updateRestock(itemName: String) {
    print("How many units of \(itemName) would you like to restock?:")
    if let quantityInput = readLine(), let quantity = Int(quantityInput) {
        //Tells the user what item and qaunity they updated
        print("Restocked \(quantity) units of \(itemName)")
        //Check what item the user selected and updates the qaunity for the item
        if itemName == "Cereal" {
            cerealStockQuan += quantity
        }
        
        if itemName == "Milk" {
            milkStockQuan += quantity
        }
        
        if itemName == "Syrup" {
            syrupStockQuan += quantity
        }
        
        if itemName == "Cups" {
            cupsStockQuan += quantity
        }
        
        //After the item been check it re-shows the Admin Screen
        print("")
        print("")
        AdminScreen()
    } else {
        //If the user input another format instead of number it will return this error
        print("Invalid quantity input, Please enter a number")
    }
}


//MARK: Menu Display
//Main Display
func menuDisplay() {
    print("")
    print("")
    print("Welcome to the grocery store! Lets us know how we can help you (Enter number of selection): ")
    print("1.Add item to cart")
    print("2.Remove item form cart")
    print("3.Check if item is in stock")
    print("4.Admin Menu")
    print("5.Checkout")
}


//MARK: Add To Cart Menu
func addToCartMenu() {
    print("What would you like to add to cart? (Enter number of selection")
    print("1.Cereal")
    print("2.Milk")
    print("3.Syrup")
    print("4.Cups")
}


//MARK: Chechout Screen
//Print out what the user bought and tell them what the total is times the state tax
func checkoutScreen() {
    print("Thanks for shopping with us!")
    print("You purchases the following:")
    print("Cereal: \(numberOfCeralBought)")
    print("Milk \(numberOfMilksBought)")
    print("Syrup \(numberOfSyrupBought)")
    print("Cups \(numberOfCupsBought)")
    print("Your grand total including tax (9.25%) is: $\(Int(userCart * 1.0925))")
    //Takes the amount of items in the user cart and times it b state tax
}


//MARK: Admin Screen
//Shows options only avaiable to admin
func AdminScreen() {
    print("Welcome to the Admin menu! Lets us know how we can help you (Enter number of selection): ")
    print("1. Restock inventory")
    print("2. Generate report")
    print("3. Check number of items")
    print("4. Quit admin menu")
    
    if let userInput = readLine() {
        if userInput == "1" {
            RestockMenu() //Allows the Admin to restock the store items
        }
        
        if userInput == "2" {
            SummaryReport() //Shows the Admin how many items are in stock and whether they need to update the screen
        }
        
        if userInput == "3" {
            CheckStock() //Allows the Admin to check the stock in the store
        }
        
        if userInput == "4" {
            menuDisplay() //Quit Admin menu and returns to main menu display
        }
    }
}


//MARK: Admin
func Admin() {
    print("Enter your Admin ID:")
    if let userInput = readLine(), let enteredId = Int(userInput) {
        //Check if number enter by user is the Admin Number
        if enteredId == AdminId {
            //If number is correct will show Admin Screen
            print("Authencation Sucessfuly, Today is \(todayDate.formatted(date: .long, time: .shortened))")
            print("")
            print("")
            AdminScreen()
        } else {
            //If number enter by user is wrong. Will print message and return to main display
            print("Incorrect Admin ID. Access denied.")
            menuDisplay()
        }
    } else {
        //If response by user is not a number will show error
        print("Invalid input. Please enter a valid Admin ID.")
    }
}

//MARK: Summary Report
//Shows stock of items and how many are remaining as well as how many sales have been made
func SummaryReport() {
    print("Summary Report")
    print("Remaining cereals: \(cerealStockQuan) items")
    print("Remaining milks: \(milkStockQuan) items")
    print("Remaining syrups: \(syrupStockQuan) items")
    print("Remaining cups:  \(cupsStockQuan) items")
    print("Remaining Inventory: \(cerealStockQuan + milkStockQuan + syrupStockQuan + cupsStockQuan) items")
    print("Total Sales: $\(Int(totalSales))")
    print("")
    print("")
    //Shows admin screen after data is showed
    AdminScreen()
}

//MARK: Restock Menu
//
func RestockMenu() {
    print("What would you like to restock?  (Enter number of selection): ")
    print("1.Cereal")
    print("2.Milk")
    print("3.Syrup")
    print("4.Cups")
    
    if let userInput = readLine() {
        if userInput == "1" {
             updateRestock(itemName: "Cereal")
        }
        
        if userInput == "2" {
           updateRestock(itemName: "Milk")
        }
        
        if userInput == "3" {
            updateRestock(itemName: "Syrup")
        }
        
        if userInput == "4" {
            updateRestock(itemName: "Cups")
        }
    }
}


//MARK: Check Stock
//Check the store inventory when the users wants to kown what item is in stock
func CheckStock() {
    print("What item would you like to check if it's in stock? (Enter number of selection)")
    print("1.Cereal")
    print("2.Milk")
    print("3.Syrup")
    print("4.Cups")
    
    if let userInput = readLine() {
        if userInput == "1" {
            print("There are currently \(cerealStockQuan) Cereals in stock!. Stock was last updated: \(stockUpdateDate.formatted(date: .long, time: .shortened)))")
            print("")
            print("")
        }
        
        if userInput == "2" {
            print("There are currently \(milkStockQuan) Milks in stock!. Stock was last updated: \(stockUpdateDate.formatted(date: .long, time: .shortened)))")
            print("")
            print("")
        }
        
        if userInput == "3" {
            print("There are currently \(syrupStockQuan) Syrups in stock!. Stock was last updated: \(stockUpdateDate.formatted(date: .long, time: .shortened)))")
            print("")
            print("")
        }
        
        if userInput == "4" {
            print("There are currently \(cupsStockQuan) Cups in stock!. Stock was last updated: \(stockUpdateDate.formatted(date: .long, time: .shortened))) ")
            print("")
            print("")
        }
    }
}
