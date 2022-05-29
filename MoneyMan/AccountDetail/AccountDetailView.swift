//
//  AccountDetailView.swift
//  MoneyMan
//
//  Created by Mike Shevelinsky on 29.05.2022.
//

import SwiftUI
import RealmSwift

struct AccountDetailView: View {

    @ObservedRealmObject var account: Account

    var body: some View {
        List {
            Section {
                AccountCellView(account: account)
            }
            Section("Transactions") {
                ForEach(account.transactions) { transaction in
                    TransactionCellView(transaction: transaction)

                }
            }
        }
    }
}

struct AccountDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AccountDetailView(account: mockAccount)
    }

    static let mockAccount: Account = {
        let account = Account()
        account.name = "Mock account"
        account.baseAmount = 2799
        return account
    }()
}
