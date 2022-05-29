//
//  AccountCellView.swift
//  MoneyMan
//
//  Created by Mike Shevelinsky on 29.05.2022.
//

import SwiftUI

struct AccountCellView: View {

    var account: Account

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(account.name)
                    .font(.headline)
                Text("This is a demo description")
                    .font(.caption)
            }
            Spacer()
            Text(account.displayValue)
                .font(.title)
        }.padding()
    }
}

struct AccountCellView_Previews: PreviewProvider {
    static var previews: some View {
        List {
            AccountCellView(account: mockAccount)
        }
    }

    static let mockAccount: Account = {
        let account = Account()
        account.name = "Mock account"
        account.amount = 2799
        return account
    }()
}
