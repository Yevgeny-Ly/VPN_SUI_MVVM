//
//  VpnViewModal.swift
//  VPN_SUI_MVVM
//

import SwiftUI

struct ItemModel {
    var numberDay: String
    var description: String
}

final class VpnViewModel: ObservableObject {
    @Published var selectedItem: ItemModel?
    
    public func makeElement(numberDay: String, title: String) {
        selectedItem = .init(numberDay: numberDay, description: title)
    }
}

