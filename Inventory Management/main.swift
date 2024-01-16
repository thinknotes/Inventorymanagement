//
//  main.swift
//  Inventory Management
//
//  Created by StudentAM on 1/12/24.
//

import Foundation

//Item Prices
let cerealsprice: Double = 4.99
let milkprice: Double = 4.99
let syrupprice: Double = 3.99
let cupsprice: Double = 2.99

//Item Quanity In Stock

let cerealStockQuan: Int = 100
let milkStockQuan: Int = 100
let syrupStockQuan: Int = 100
let cupsStockQuan: Int = 100
let stockUpdateDate: Date = .distantPast

//User Cart
var userCart: Double = 0.0
var numberOfItemsUserBought: Double = 0.0
let totalSales: Double = 0.0



//Admin
let AdminId: Int = 33039
let todayDate: Date = .distantPast

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
                    addToCart(userInputString: "userInputString", userInput: Double(userInput)!, itemName: "Cereal", itemPrice: cerealsprice)
                    print("")
                    print("")
                    menuDisplay()
                    
                } else if userInput == "2" {
                    addToCart(userInputString: "userInputString", userInput: Double(userInput)!, itemName: "Milk", itemPrice: milkprice)
                    print("")
                    print("")
                    menuDisplay()
                } else if userInput == "3" {
                    addToCart(userInputString: "userInputString", userInput: Double(userInput)!, itemName: "Syrup", itemPrice: syrupprice)
                    print("")
                    print("")
                    menuDisplay()
                } else if userInput == "4" {
                    addToCart(userInputString: "userInputString", userInput: Double(userInput)!, itemName: "Cups", itemPrice: cupsprice)
                    print("")
                    print("")
                    menuDisplay()
                } else {
                    print("Option Not Found")
                    
                }
                
                
            }
            
        }
        
        if optionsSelected == 2 {
            
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
    
    
   


func addToCart(userInputString: String, userInput: Double, itemName: String, itemPrice: Double) {
    print("How many \(itemName)s would like to add to your cart")
    if let userInputString = readLine(), let userInput = Double(userInputString) {
        print("You have added \(userInput) \(itemName) to your cart!")
        let total = userInput * itemPrice
        let formattedTotal = String(format: "%.2f", total)
        userCart += total
        numberOfItemsUserBought += userInput
        print("Current total: $\(formattedTotal)")
    } else {
        print("Invalid input. Please enter a valid number")
    }
}


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
    print("Cereal")
    print("Milk")
    print("Syrup")
    print("Cups")
    print("Your grand total including tax (9.25%) is: \(userCart * 0.0925)")
}

func AdminScreen() {
    print("Welcome to the Admin menu! Lets us know how we can help you (Enter number of selection): ")
    print("1. Restock inventory")
    print("2. Generate report")
    print("3. Check number of items")
    print("4. Quit admin menu")
    
    if let userInput = readLine() {
        if userInput == "1" {
            
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

func SummaryReport() {
    print("Summary Report")
    print("Remaining cereals: \(cerealStockQuan) items")
    print("Remaining milks: \(milkStockQuan) items")
    print("Remaining syrups: \(syrupStockQuan) items")
    print("Remaining cups:  \(cupsStockQuan) items")
    print("Remaining Inventory: \(cerealStockQuan + milkStockQuan + syrupStockQuan + cupsStockQuan) items")
    print("Total Sales: $0.0")
}
