//
//  TransactionTypeModel.swift
//  Income
//
//  Created by Mac on 08/04/2025.
//

import Foundation
import RealmSwift

enum TransactionType: String, CaseIterable, Identifiable, PersistableEnum {
    case income, expense
    var id: Self { self }
    
    var title: String {
        switch self {
        case .income:
            return "Income"
        case .expense:
            return "Expense"
        }
    }
}
