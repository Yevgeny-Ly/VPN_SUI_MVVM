//
//  HomeView.swift
//  VPN_SUI_MVVM
//

import SwiftUI

struct HomeView: View {
    enum Constants {
        static var titleCountryFrance = "France"
        static var titleActivateVPN = "VPN активирован"
        static var titleAdressIP = "IP Address"
        static var titleIP = "127.0.0.1"
        static var titleTrafficReceived = "Received"
        static var titleValueTrafficReceived = "0 MB"
        static var titleTrafficSend = "Sent"
        static var titleValueTrafficSend = "0 MB"
        static var titleExpirationWarningVPN = "Service will expire after 15 days."
    }
    
    @State private var isOnToggle = false
    @State private var isOnAlert = false
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea(.all)
            VStack {
                Spacer()
                    .frame(height: 100)
                Image(.france)
                Text(Constants.titleCountryFrance)
                    .foregroundColor(.white)
                Toggle("", isOn: $isOnToggle)
                    .frame(width: 50)
                    .padding()
                    .onChange(of: isOnToggle, perform: { newValue in
                        if newValue {
                            isOnAlert.toggle()
                        }
                    })
                    .alert(isPresented: $isOnAlert, content: {
                        Alert(title: Text(Constants.titleActivateVPN))
                    })
                makeInfoConnectVPN(field: Constants.titleAdressIP, value: Constants.titleIP)
                makeInfoConnectVPN(field: Constants.titleTrafficReceived, value: Constants.titleValueTrafficReceived)
                makeInfoConnectVPN(field: Constants.titleTrafficSend, value: Constants.titleValueTrafficSend)
                Spacer()
                Text(Constants.titleExpirationWarningVPN)
                    .foregroundColor(.white)
                    .padding()
            }
        }
    }
    
    private func makeInfoConnectVPN(field: String, value: String) -> some View {
        HStack {
            Text(field)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 70)
                .padding().frame(height: 30)
            Text(value)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.trailing, 70)
                .padding().frame(height: 30)
        }
    }
}
