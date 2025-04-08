//
//  TransactionModel.swift
//  Income
//
//  Created by Mac on 08/04/2025.
//

import Foundation
import SwiftUI
import RealmSwift

class TransactionModel: Object, ObjectKeyIdentifiable {
    
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var title: String
    @Persisted var type: TransactionType
    @Persisted var amount: Double
    @Persisted var date: Date
    
    convenience init(_id: ObjectId, title: String, type: TransactionType, amount: Double, date: Date) {
        self.init()
        self._id = _id
        self.title = title
        self.type = type
        self.amount = amount
        self.date = date
    }
    
    var displayDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        return dateFormatter.string(from: date)
    }
    
    func display(currency: Currency) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.locale = currency.locale
        return numberFormatter.string(from: amount as NSNumber) ?? ""
    }
    
}

struct Transaction: Identifiable {
    
    let id = UUID()
    let title: String
    let type: TransactionType
    let amount: Double
    let date: Date
    
    var displayDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        return dateFormatter.string(from: date)
    }
    
    func display(currency: Currency) -> String {
        
//        let transaction = Transaction(title: <#T##String#>, type: <#T##TransactionType#>, amount: <#T##Double#>, date: <#T##Date#>)
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.locale = currency.locale
        return numberFormatter.string(from: amount as NSNumber) ?? ""
    }
    
}

extension Transaction: Hashable {
    
    static func == (lhs: Transaction, rhs: Transaction) -> Bool {
        lhs.id == rhs.id
    }
    
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
}
