//
//  BasketView.swift
//  VPN_SUI_MVVM
//

import SwiftUI

/// Экран корзины
struct BasketView: View {
    enum Constants {
        static var titleСhoosed = "You choosed"
        static var titlePay = "Please check and pay the selected tariff"
        static var titleFontVerdanaBold = "Verdana-Bold"
        static var titleNameButton = "Buy"
    }
    
    @EnvironmentObject var viewModel: VpnViewModel
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.black
                .ignoresSafeArea(.all)
            VStack(alignment: .center) {
                Text(Constants.titleСhoosed)
                    .foregroundColor(.white)
                    .font(.largeTitle)
                Text(Constants.titlePay)
                    .foregroundStyle(.white)
                ScrollView(showsIndicators: false) {
                    HStack {
                        ZStack {
                            if viewModel.selectedItem != nil {
                                Image(.calendar)
                            }
                            if viewModel.selectedItem != nil {
                                Text(viewModel.selectedItem?.numberDay ?? "")
                                    .offset(y: 15)
                                    .font(.custom(Constants.titleFontVerdanaBold, fixedSize: 36))
                            }
                        }
                        VStack(alignment: .center) {
                            Text(viewModel.selectedItem?.description ?? "")
                                .foregroundStyle(.white)
                                .edgesIgnoringSafeArea(.all)
                                .multilineTextAlignment(.center)
                                .frame(width: 179, height: 76, alignment: .center)
                        }
                    }
                    if viewModel.selectedItem != nil {
                    Button(action: {
                     }, label: {
                         Text(Constants.titleNameButton)
                            .padding()
                            .frame(width: 342)
                            .background(Color.blue)
                            .foregroundColor(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    })
                }
                }
            }
        }
    }
}
