//
//  ContentView.swift
//  VPN_SUI_MVVM
//

import SwiftUI

/// Настройка tabView
struct MainTabView: View {
    private enum Constants {
        static var titleBarVPN = "VPN"
        static var nameBarItemLock = "lock.fill"
        static var titleBarPurchase = "Purchase"
        static var nameBarItemLine = "line.3.horizontal"
        static var titleBarBascket = "Bascket"
        static var nameBarItemBasket = "basket.fill"
    }
    
    @ObservedObject var viewModel = VpnViewModel()
    @State private var selected = 1
    
    var body: some View {
        TabView(selection: $selected) {
            HomeView()
                .tag(1)
                .badge(1)
                .tabItem {
                    Image(systemName: Constants.nameBarItemLock)
                    Text(Constants.titleBarVPN)
                }
            PurchaseView()
                .environmentObject(viewModel)
                .tag(2)
                .tabItem {
                    Image(systemName: Constants.nameBarItemLine)
                    Text(Constants.titleBarPurchase)
                }
            BasketView()
                .environmentObject(viewModel)
                .tag(3)
                .tabItem {
                    Image(systemName: Constants.nameBarItemBasket)
                    Text(Constants.titleBarBascket)
                }
        }
        .onAppear() {
            UITabBar.appearance().backgroundColor = .tabViewBacground
        }
        .font(.headline)
    }
}

#Preview {
    MainTabView()
}
