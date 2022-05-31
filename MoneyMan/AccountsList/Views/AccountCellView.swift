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
        ZStack {
            Gradients.all[account.style]
            VStack {
                VStack {
                    HStack {
                        VStack(alignment: .leading) {
                            Text(account.name)
                                .font(.headline)
                                .foregroundColor(.white)
                            Text("This is a demo description")
                                .font(.caption)
                                .foregroundColor(.white)
                        }
                        Spacer()
                        Text(account.displayValue)
                            .font(.title)
                            .foregroundColor(.white)
                    }
                }
                    .padding([.top, .leading, .trailing])
                if (!account.transactions.isEmpty) {
                    AccountChartView(account: account)
                } else {
                    Spacer()
                }
            }
        }
        .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
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
        account.baseAmount = 2799
        return account
    }()
}
