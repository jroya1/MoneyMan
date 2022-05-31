//
//  CreateAccountView.swift
//  MoneyMan
//
//  Created by Mike Shevelinsky on 29.05.2022.
//

import SwiftUI
import RealmSwift

struct CreateAccountView: View {

    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    @State var name: String = ""
    @State var selectedStyle = 0

    var body: some View {
        Form {
            TextField("Name", text: $name)
            HStack {
                ForEach(Gradients.all.indices) { index in
                    RoundedRectangle(cornerRadius: 4)
                        .fill(Gradients.all[index])
                        .aspectRatio(1.0, contentMode: .fit)
                        .padding(index == selectedStyle ? 8 : 12)
                        .onTapGesture {
                            selectedStyle = index
                        }
                }
            }
            Button {
                let realm = try! Realm()
                try! realm.write {
                    let account = Account()
                    account.name = name
                    account.style = selectedStyle
                    realm.add(account)
                    self.presentationMode.wrappedValue.dismiss()
                }
            } label: {
                Text("Save")
            }
        }
    }
}

struct CreateAccountView_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccountView()
    }
}
