//
//  Gradients.swift
//  MoneyMan
//
//  Created by Mike Shevelinsky on 31.05.2022.
//

import SwiftUI

final class Gradients {
    static let all = [gradinet("#2c3e50", "#3498db"),
                      gradinet("#2980B9", "#6DD5FA"),
                      gradinet("#659999", "#f4791f"),
                      gradinet("#009FFF", "#ec2F4B"),
                      gradinet("#005AA7", "#FFFDE4")]

    private static func gradinet(_ colorA: String, _ colorB: String) -> LinearGradient {
        return LinearGradient(gradient: Gradient(colors: [Color(hex: colorA), Color(hex: colorB)]), startPoint: .top, endPoint: .bottom)
    }

    static let white = LinearGradient(gradient: Gradient(colors: [Color(red: 1, green: 1, blue: 1, opacity: 0.5), .clear]), startPoint: .top, endPoint: .bottom)
}
