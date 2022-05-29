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
    @Persisted var amount = 0
    
    @Persisted var transactions = RealmSwift.List<Transaction>()
}

extension Account {
    var displayValue: String {
        return "\(Double(amount) / 100.0) $"
    }
}
