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

var  cerealStockQuan: Int = 100
var  milkStockQuan: Int = 100
var  syrupStockQuan: Int = 100
var  cupsStockQuan: Int = 100
let  stockUpdateDate: Date = .distantPast

//MARK: User Cart
//User Cart
var userCart: Double = 0.0
var numberOfItemsUserBought: Double = 0.0
let totalSales: Double = 0.0

var numberOfCeralBought: Int = 0
var numberOfMilksBought: Int = 0
var numberOfSyrupBought: Int = 0
var numberOfCupsBought: Int = 0


//MARK: Admin
//Admin
let AdminId: Int = 33039
let todayDate: Date = .distantPast

//MARK: For While Loop
//For While Loop
var optionsSelected = 0


while optionsSelected != 5  {
    menuDisplay()
    if let userInput = readLine(), let selectedOption = Int(userInput) {
        
        optionsSelected = selectedOption
        
        if optionsSelected == 1 {
            addToCartMenu()
            
            if let userInput = readLine() {
                if userInput == "1" {
                    addToCart(userInputString: "userInputString", userInput: Int(userInput)!, itemName: "Cereal", itemPrice: cerealsprice)
                    print("")
                    print("")
                   
                    
                } else if userInput == "2" {
                    addToCart(userInputString: "userInputString", userInput: Int(userInput)!, itemName: "Milk", itemPrice: milkprice)
                    print("")
                    print("")
                   
                } else if userInput == "3" {
                    addToCart(userInputString: "userInputString", userInput: Int(userInput)!, itemName: "Syrup", itemPrice: syrupprice)
                    print("")
                    print("")
                    
                } else if userInput == "4" {
                    addToCart(userInputString: "userInputString", userInput: Int(userInput)!, itemName: "Cups", itemPrice: cupsprice)
                    print("")
                    print("")
                  
                } else {
                    print("Option Not Found")
                    
                }
                
                
            }
            
        }
        
        if optionsSelected == 2 {
            print("What item would you like to  remove from your cart? (Enter number of selection)")
            print("1.Cereal")
            print("2.Milk")
            print("3.Syrup")
            print("4.Cups")
            
            if let userInput = readLine() {
                if userInput == "1" {
                    removeItemFromCart(userInput: Int(userInput)!, itemName: "Cereal")
                }
                
                
                if userInput == "2" {
                    removeItemFromCart(userInput: Int(userInput)!, itemName: "Milk")
                }
                
                if userInput == "3" {
                    removeItemFromCart(userInput: Int(userInput)!, itemName: "Syrup")
                }
                
                if userInput == "4" {
                    removeItemFromCart(userInput: Int(userInput)!, itemName: "Cups")
                }
                
                
            }
        }
        
        if optionsSelected == 3 {
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
        
        if optionsSelected == 4 {
            Admin()
        }
        
        if optionsSelected == 5 {
            checkoutScreen()
        }
        
    }
}
    
 //MARK: Remove Item From Cart
func removeItemFromCart(userInput: Int, itemName: String) {
    print("How many \(itemName)s would like to remove from your cart")
    if let userInputString = readLine(), let userInput = Int(userInputString) {
        if itemName == "Cereal" {
            numberOfCeralBought -= userInput
            cerealStockQuan += userInput
            if userInput > cerealStockQuan {
                print("You dont have \(userInput) Cereal in your cart. We are going to remove \(cerealStockQuan) from your cart. ")
                print("You now have 0 Cereal in your cart.")
            }
        } else if itemName == "Milk" {
            numberOfMilksBought -= userInput
            milkStockQuan += userInput
            if userInput > milkStockQuan {
                print("You dont have \(userInput) Milk in your cart. We are going to remove \(milkStockQuan) from your cart. ")
                print("You now have 0 Milk in your cart.")
            }
        
            
        } else if itemName == "Syrup" {
            numberOfSyrupBought -= userInput
            syrupStockQuan += userInput
            if userInput > syrupStockQuan {
                print("You dont have \(userInput) Syrup in your cart. We are going to remove \(syrupStockQuan) from your cart. ")
                print("You now have 0 Syrup in your cart.")
            }
            
        } else if itemName == "Cups" {
            numberOfCupsBought -= userInput
            cupsStockQuan += userInput
            if userInput > cupsStockQuan {
                print("You dont have \(userInput) Cups in your cart. We are going to remove \(cupsStockQuan) from your cart. ")
                print("You now have 0 Cups in your cart.")
            }
        }
        
        
        print("You have removed \(userInput) \(itemName) from your cart!")
        
    
    }
}


//MARK: Add To Cart
func addToCart(userInputString: String, userInput: Int, itemName: String, itemPrice: Double) {
    print("How many \(itemName)s would like to add to your cart")
    if let userInputString = readLine(), let userInput = Double(userInputString) {
        print("You have added \(userInput) \(itemName) to your cart!")
        let total = userInput * itemPrice
        let formattedTotal = String(format: "%.2f", total)
        userCart += total
        
        if itemName == "Cereal" {
            numberOfCeralBought += Int(userInput)
            cerealStockQuan -= Int(userInput)
            if Int(userInput) > cerealStockQuan {
                print("The item your trying to buy - Cereal is not in stock. Pls try a lower quanity or check another store. ")
            }
        }
        
        if itemName == "Milk" {
            numberOfMilksBought += Int(userInput)
            milkStockQuan -= Int(userInput)
        }
        
        if itemName == "Syrup" {
            numberOfSyrupBought += Int(userInput)
            syrupStockQuan -= Int(userInput)
        }
        
        if itemName == "Cups" {
            numberOfCupsBought += Int(userInput)
            cupsStockQuan -= Int(userInput)
        }
        
        print("Current total: $\(formattedTotal)")
    } else {
        print("Invalid input. Please enter a valid number")
    }
}


//MARK: Update Restock
func updateRestock(itemName: String) {
    print("How many units of \(itemName) would you like to restock?:")
    if let quantityInput = readLine(), let quantity = Int(quantityInput) {
        print("Restocked \(quantity) units of \(itemName)")
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
        
        print("")
        print("")
        AdminScreen()
    } else {
        print("Invalid quantity input, Please enter a number")
    }
}


//MARK: Menu Display
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

func checkoutScreen() {
    print("Thanks for shopping with us!")
    print("You purchases the following:")
    print("Cereal: \(numberOfCeralBought)")
    print("Milk \(numberOfMilksBought)")
    print("Syrup \(numberOfSyrupBought)")
    print("Cups \(numberOfCupsBought)")
    print("Your grand total including tax (9.25%) is: \(userCart * 1.0925)")
    
}


//MARK: Admin Screen
func AdminScreen() {
    print("Welcome to the Admin menu! Lets us know how we can help you (Enter number of selection): ")
    print("1. Restock inventory")
    print("2. Generate report")
    print("3. Check number of items")
    print("4. Quit admin menu")
    
    if let userInput = readLine() {
        if userInput == "1" {
            RestockMenu()
        }
        
        if userInput == "2" {
            SummaryReport()
        }
        
        if userInput == "3" {
            
        }
        
        if userInput == "4" {
            menuDisplay()
        }
    }
}


//MARK: Admin
func Admin() {
    print("Enter your Admin ID:")
    if let userInput = readLine(), let enteredId = Int(userInput) {
        if enteredId == AdminId {
            print("Authencation Sucessfuly, Today is \(todayDate.formatted(date: .long, time: .shortened))")
            print("")
            print("")
            AdminScreen()
        } else {
            print("Incorrect Admin ID. Access denied.")
            menuDisplay()
        }
    } else {
        print("Invalid input. Please enter a valid Admin ID.")
    }
}

//MARK: Summary Report
func SummaryReport() {
    print("Summary Report")
    print("Remaining cereals: \(cerealStockQuan) items")
    print("Remaining milks: \(milkStockQuan) items")
    print("Remaining syrups: \(syrupStockQuan) items")
    print("Remaining cups:  \(cupsStockQuan) items")
    print("Remaining Inventory: \(cerealStockQuan + milkStockQuan + syrupStockQuan + cupsStockQuan) items")
    print("Total Sales: $0.0")
    print("")
    print("")
    AdminScreen()
}

//MARK: Restock Menu
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



