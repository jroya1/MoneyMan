//
//  Account.swift
//  MoneyMan
//
//  Created by Mike Shevelinsky on 29.05.2022.
//

import Foundation
import RealmSwift

class Account: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var _id: ObjectId

    @Persisted var name: String = ""
    @Persisted var baseAmount = 0
    @Persisted var style = 0
    
    @Persisted var transactions = RealmSwift.List<Transaction>()
}

extension Account {
    var displayValue: String {
        let transactions = transactions.reduce(0, { $0 + $1.amount })
        return "\(Double(baseAmount + transactions) / 100.0) $"
    }
}
