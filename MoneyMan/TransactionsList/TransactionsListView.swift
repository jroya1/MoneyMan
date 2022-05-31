//
//  TransactionsListView.swift
//  MoneyMan
//
//  Created by Mike Shevelinsky on 29.05.2022.
//

import SwiftUI
import RealmSwift

struct TransactionsListView: View {

    @ObservedObject var model = TransactionListModel()

    var body: some View {
        NavigationView {
            List {
                ForEach(model.groupedTransactions, id: \.self) { group in
                    Section(model.format(date: group.first!.date)) {
                        ForEach(group) { transaction in
                            TransactionCellView(transaction: transaction)
                        }
                    }
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
