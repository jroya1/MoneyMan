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

    var body: some View {
        Form {
            TextField("Name", text: $name)
            Button {
                let realm = try! Realm()
                try! realm.write {
                    let account = Account()
                    account.name = name

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
