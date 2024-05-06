//
//  PurchaseView.swift
//  VPN_SUI_MVVM
//

import SwiftUI

/// Экран Оплаты
struct PurchaseView: View {
    enum Constants {
        static var titlePrivacy = "Privacy Matters"
        static var titleActivitiesVPN = "Protect your online activities with VPN Plus"
        static var titleSevenCalendarDays = "7"
        static var titleThirtyCalendarDays = "30"
        static var titleNinetyCalendarDays = "90"
        static var titleVacationAccess = "Vacation (7 days) 99 RUB"
        static var titleStandartAccess = "Standart (1 month) 179 RUB"
        static var titleStandartPlusAccess = "Standart+ (3 month) 279 RUB"
        static var titleSuccessfullyPurchased = "Successfully purchased"
        static var titleFontVerdanaBold = "Verdana-Bold"
        static var titleNameButton = "Buy"
        static var titleСhoosed = "Added"
    }
    
    @EnvironmentObject var viewModel: VpnViewModel
    @State private var isOnAlertVacation = false
    @State private var isOnAlertStandart = false
    @State private var isOnAlertStandartPlus = false
    @State private var isTappedButtonVacation = false
    @State private var isTappedButtonStandart = false
    @State private var isTappedButtonStandartPlus = false
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea(.all)
            VStack(alignment: .center) {
                Text(Constants.titlePrivacy)
                    .foregroundColor(.white)
                    .font(.largeTitle)
                Text(Constants.titleActivitiesVPN)
                    .foregroundStyle(.white)
                
                ScrollView(showsIndicators: false) {
                    makeCard(numberDay: Constants.titleSevenCalendarDays, title: Constants.titleVacationAccess, alertTitle: Constants.titleVacationAccess, isOnAlert: $isOnAlertVacation, isTappedButton: $isTappedButtonVacation) { textTitle in
                        viewModel.makeElement(numberDay: Constants.titleSevenCalendarDays, title: textTitle)
                    }
                    makeCard(numberDay: Constants.titleThirtyCalendarDays, title: Constants.titleStandartAccess, alertTitle: Constants.titleStandartAccess, isOnAlert: $isOnAlertStandart, isTappedButton: $isTappedButtonStandart) { textTitle in
                        viewModel.makeElement(numberDay: Constants.titleThirtyCalendarDays, title: textTitle)
                    }
                    makeCard(numberDay: Constants.titleNinetyCalendarDays, title: Constants.titleStandartPlusAccess, alertTitle: Constants.titleStandartPlusAccess, isOnAlert: $isOnAlertStandartPlus, isTappedButton: $isTappedButtonStandartPlus) { textTitle in
                        viewModel.makeElement(numberDay: Constants.titleNinetyCalendarDays, title: textTitle)
                    }
                }
            }
        }
    }
    
    private func makeCard(numberDay: String, title: String, alertTitle: String, isOnAlert: Binding<Bool>, isTappedButton: Binding<Bool>, actionHandler: @escaping (String) -> ()) -> some View {
        VStack {
            ZStack {
                Image(.calendar)
                Text(numberDay)
                    .offset(y: 15)
                    .font(.custom(Constants.titleFontVerdanaBold, fixedSize: 36))
            }
            Text(title)
                .foregroundColor(.white)
            Button(action: {
                actionHandler(alertTitle)
                isOnAlert.wrappedValue.toggle()
                isTappedButton.wrappedValue = true
            }, label: {
                Text(isTappedButton.wrappedValue ? Constants.titleСhoosed : Constants.titleNameButton)
                    .padding()
                    .frame(width: 90)
                    .background(isTappedButton.wrappedValue ? Color.buttonPressedBackground : Color.blue)
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            })
            .alert(isPresented: isOnAlert, content: {
                Alert(title: Text(alertTitle), message: Text(Constants.titleSuccessfullyPurchased))
            })
        }
    }
}
