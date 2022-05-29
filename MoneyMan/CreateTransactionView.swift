//
//  CreateTransactionView.swift
//  MoneyMan
//
//  Created by Mike Shevelinsky on 29.05.2022.
//

import SwiftUI
import RealmSwift

struct CreateTransactionView: View {

    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    @ObservedResults(Account.self) var accounts

    @State var name: String = ""
    @State var amount = ""
    @State var isExpense = false

    @State var selectedAccount: Account?

    var body: some View {
        Form {
            TextField("Name", text: $name)
            TextField("Amount", text: $amount)
                .keyboardType(.decimalPad)
            HStack {
                Spacer()
                Button {
                    isExpense = false
                    print(isExpense)
                } label: {
                    Text("Income")
                        .foregroundColor(!isExpense ? .green : .gray)
                }
                .buttonStyle(BorderlessButtonStyle())
                Spacer()
                Divider()
                Spacer()
                Button {
                    isExpense = true
                    print(isExpense)
                } label: {
                    Text("Expense")
                        .foregroundColor(isExpense ? .red : .gray)
                }
                .buttonStyle(BorderlessButtonStyle())
                Spacer()
            }

            Section("Account") {
                ForEach(accounts) { account in
                    Button {
                        selectedAccount = account
                    } label: {
                        HStack {
                            Text(account.name)
                            Spacer()
                            Text(account.displayValue)
                                .foregroundColor(.gray)
                            if account == selectedAccount {
                                Image(systemName: "checkmark")
                            }
                        }
                    }
                }
            }

            Button {
                let realm = try! Realm()
                guard let account = selectedAccount?.thaw() else {
                    return
                }
                try! realm.write {
                    let transaction = Transaction()
                    transaction.name = name
                    transaction.amount = Int((Double(amount) ?? 0.0) * 100) * (isExpense ? -1 : 1)
                    realm.add(transaction)
                    account.transactions.append(transaction)
                    self.presentationMode.wrappedValue.dismiss()
                }
            } label: {
                Text("Save")
            }
        }
    }
}

struct CreateTransactionView_Previews: PreviewProvider {
    static var previews: some View {
        CreateTransactionView()
    }
}
