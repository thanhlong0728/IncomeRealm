//
//  TransactionTypeModel.swift
//  Income
//
//  Created by Mac on 08/04/2025.
//

import Foundation

enum TransactionType: String, CaseIterable, Identifiable {
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
