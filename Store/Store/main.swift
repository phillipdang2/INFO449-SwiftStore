//
//  main.swift
//  Store
//
//  Created by Ted Neward on 2/29/24.
//

import Foundation

protocol SKU {
    var name: String { get }
    func price() -> Int
}

class Item: SKU {
    var name: String
    var priceEach: Int
    
    init(name: String, priceEach: Int) {
        self.name = name
        self.priceEach = priceEach
    }
    
    func price() -> Int {
        return self.priceEach
    }
}

class Receipt {
    var itemList: [Item] = []
    
    func items() -> [Item] {
        return self.itemList
    }
    
    func output() -> String {
        var output = "Receipt:\n"
        
        for item in itemList {
            output += "\(item.name): $\(Double(item.price()) / 100)\n"
        }
        return output + """
        ------------------
        TOTAL: $\(Double(self.total()) / 100)
        """
    }
    
    func total() -> Int {
        var total = 0
        for item in itemList {
            total += item.price()
        }
        return total
    }
}

class Register {
    var receipt = Receipt()
    var totalPrice = 0
    
    func scan(_ item: Item) {
        receipt.itemList.append(item)
        totalPrice += item.price()
    }
    
    func subtotal() -> Int {
        return self.totalPrice
    }
    
    func total() -> Receipt {
        let receiptCopy = Receipt()
        receiptCopy.itemList += receipt.items()
        receipt = Receipt()
        return receiptCopy
    }
}

class Store {
    let version = "0.1"
    func helloWorld() -> String {
        return "Hello world"
    }
}

