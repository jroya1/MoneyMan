//
//  AccountChartView.swift
//  MoneyMan
//
//  Created by Mike Shevelinsky on 31.05.2022.
//

import SwiftUI

struct AccountChartView: View {

    var account: Account

    private func deltas() -> [Int] {
        var baseAmount = account.baseAmount
        var res = baseAmount == 0 ? [] : [baseAmount]
        for transaction in account.transactions {
            baseAmount += transaction.amount
            res.append(baseAmount)
        }

        return res
    }

    private func points(size: CGSize) -> [CGPoint] {
        let deltas = deltas()
        if deltas.isEmpty {
            return []
        }
        let hStep: CGFloat = size.width / CGFloat(deltas.count - 1)
        let vStep: CGFloat = size.height / CGFloat(deltas.max()!)

        var result = [CGPoint]()

        for index in deltas.indices {
            result.append(CGPoint(x: CGFloat(index) * hStep, y: size.height - CGFloat(deltas[index]) * vStep))
        }
        return result
    }

    var body: some View {
        if points(size: .zero).isEmpty {
            Text("No transactions")
        } else {
            GeometryReader { reader in
                Path { p in
                    let points = points(size: reader.size)
                    p.move(to: points.first!)
                    for point in points {
                        p.addLine(to: point)
                    }
                }
                .stroke(.white, lineWidth: 2.0)

                Path { p in
                    p.move(to: CGPoint(x: 0, y: reader.size.height / 2.0))
                    let points = points(size: reader.size)

                    for point in points {
                        p.move(to: point)
                        p.addLine(to: CGPoint(x: point.x, y: reader.size.height))
                    }
                }
                .stroke(.white, lineWidth: 0.5)
            }
        }
    }
}

struct AccountChartView_Previews: PreviewProvider {
    static var previews: some View {
        //AccountChartView()
        Text("temp")
    }
}
