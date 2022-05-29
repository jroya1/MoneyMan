//
//  TransactionsListView.swift
//  MoneyMan
//
//  Created by Mike Shevelinsky on 29.05.2022.
//

import SwiftUI
import RealmSwift

struct TransactionsListView: View {

    @ObservedResults(Transaction.self) var transactions

    var body: some View {
        NavigationView {
            List {
                ForEach(transactions) { transaction in
                        TransactionCellView(transaction: transaction)
                }
                Section {
                    NavigationLink {
                        CreateTransactionView()
                    } label: {
                        Text("Create new transaction")
                    }
                }
            }
            .navigationTitle("Transactions")
        }
    }
}

struct TransactionsListView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionsListView()
    }
}
