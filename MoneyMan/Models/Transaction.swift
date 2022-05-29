//
//  Transaction.swift
//  MoneyMan
//
//  Created by Mike Shevelinsky on 29.05.2022.
//

import Foundation
import RealmSwift

class Transaction: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var _id: ObjectId

    @Persisted var name: String = ""
    @Persisted var amount: Int = 0
    @Persisted var date: Date = Date()
    
    @Persisted(originProperty: "transactions") var account: LinkingObjects<Account>
}

extension Transaction {
    var displayValue: String {
        return "\(Double(amount) / 100.0) $"
    }
}
