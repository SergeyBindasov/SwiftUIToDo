//
//  HideKeyBoard.swift
//  SwiftUIToDo
//
//  Created by Sergey on 29.05.2023.
//

import SwiftUI
#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
