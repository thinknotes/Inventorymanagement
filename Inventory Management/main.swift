//
//  main.swift
//  Inventory Management
//
//  Created by StudentAM on 1/12/24.
//

import Foundation

print("Welcome to the grocery store! Lets us know how we can help you (Enter number of selection): ")
print("1.Add item to cart")
print("2.Remove item form cart")
print("3.Check if item is in stock")
print("4.Admin Menu")
print("5.Checkout")
if case "1" = readLine() {
    print("What would you like to add to cart? (Enter number of selection")
    print("1.Cereal")
    print("2.Milk")
    print("3.Syrup")
    print("4.Cups")
    if case "1" = readLine() {
        print("How many cereal(s) would like to add to your cart")
    }
    if case "2" = readLine() {
        print("How many milk(s) would like to add to your cart")
    }
    if case "3" = readLine() {
        print("How many syrup(s) would like to add to your cart")
    }
    if case "4" = readLine() {
        print("How many cups(s) would like to add to your cart")
    }

}

