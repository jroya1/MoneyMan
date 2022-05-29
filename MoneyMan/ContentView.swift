//
//  ContentView.swift
//  MoneyMan
//
//  Created by Mike Shevelinsky on 29.05.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            AccountsListView()
                .tabItem {
                    Label("Accounts", systemImage: "building.columns")
                }
            TransactionsListView()
                .tabItem {
                    Label("Transactions", systemImage: "tray")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
