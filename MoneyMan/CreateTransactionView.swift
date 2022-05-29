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
    @State var amount: String = ""

    @State var selectedAccount: Account?

    var body: some View {
        Form {
            TextField("Name", text: $name)
            TextField("Amount", text: $amount)

            Section("Account") {
                ForEach(accounts) { account in
                    Button {
                        selectedAccount = account
                    } label: {
                        HStack {
                            Text(account.name)
                            Spacer()
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
                    transaction.amount = Int(amount) ?? 0
                    realm.add(transaction)
                    account.transactions.append(transaction)
                    account.amount += transaction.amount
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
