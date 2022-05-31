//
//  TransactionCellView.swift
//  MoneyMan
//
//  Created by Mike Shevelinsky on 29.05.2022.
//

import SwiftUI

struct TransactionCellView: View {

    var transaction: Transaction

    var date: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:MM"
        return dateFormatter.string(from: transaction.date)
    }

    var body: some View {
        HStack {
            Text(transaction.name)
            Spacer()
            Text(transaction.displayValue)
        }
    }
}

struct TransactionCellView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionCellView(transaction: Transaction())
    }
}
