//
//  TransactionListModel.swift
//  MoneyMan
//
//  Created by Mike Shevelinsky on 30.05.2022.
//

import Foundation
import RealmSwift

final class TransactionListModel: ObservableObject {

    @Published var groupedTransactions = [[Transaction]]()

    private var notificationTokens = [NotificationToken]()

    init() {
        setupData()
    }

    func format(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.YYYY"
        return dateFormatter.string(from: date)
    }

    private func updateGroupedTransactions(with transactions: Results<Transaction>) {
        var result = [[Transaction]]()
    outerLoop: for transaction in transactions {
        if result.isEmpty {
            result.append([transaction])
            continue
        }

        for index in 0..<result.count {
            let groupComp = Calendar.current.dateComponents([.year, .month, .day], from: result[index].first!.date)
            let transComp = Calendar.current.dateComponents([.year, .month, .day], from: transaction.date)
            if groupComp == transComp {
                result[index].append(transaction)
                continue outerLoop
            }
        }
        result.append([transaction])
    }
        groupedTransactions = result.sorted { $0.first!.date.timeIntervalSince1970 > $1.first!.date.timeIntervalSince1970}
    }

    private func setupData() {
        let realm = try! Realm()

        let token = realm.objects(Transaction.self).observe { change in
            switch change {
            case .initial(let result):
                self.updateGroupedTransactions(with: result)
            case .update(let result, deletions: _, insertions: _, modifications: _):
                self.updateGroupedTransactions(with: result)
            case .error(_):
                break
            }
        }
        notificationTokens.append(token)
    }
}
