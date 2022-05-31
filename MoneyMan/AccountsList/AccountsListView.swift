//
//  AccountsListView.swift
//  MoneyMan
//
//  Created by Mike Shevelinsky on 29.05.2022.
//

import SwiftUI
import RealmSwift

struct AccountsListView: View {

    @ObservedResults(Account.self) var accounts

    var body: some View {
        NavigationView {
            List {
                ForEach(accounts) { account in
                    Section {
                        NavigationLink {
                            AccountDetailView(account: account)
                        } label: {
                        }
                        .listRowBackground(AccountCellView(account: account))
                        .frame(height: 180.0)
                    }
                }
                Section {
                    NavigationLink {
                        CreateAccountView()
                    } label: {
                        Text("Create new account")
                    }
                }
            }
            .navigationTitle("Accounts")
        }
    }
}

struct AccountsListView_Previews: PreviewProvider {
    static var previews: some View {
        AccountsListView()
    }
}
