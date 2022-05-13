//
//  SettingsView.swift
//  AvocadoEats
//
//  Created by adam janusewski on 5/12/22.
//

import SwiftUI

struct SettingsView: View {
    
    @State private var enableNotifications: Bool = true
    @State private var backgroundRefresh: Bool = false
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 0) {
            VStack(alignment: .center, spacing: 5) {
                Image("avocado")
                    .resizable()
                    .scaledToFit()
                    .padding(.top)
                    .frame(width: 100, height: 100, alignment: .center)
                    .shadow(color: Color(red: 0, green: 0, blue: 0), radius: 8, x: 0, y: 4)
                
                Text("Hello Settings!".uppercased())
                    .font(.system(.title, design: .serif))
                    .fontWeight(.bold)
                .foregroundColor(Color("ColorGreenAdapt"))
            }
            .padding()
            
            Form {
                // Section 1
                Section(header: Text("General Settings")) {
                    // ----------------Toggles---------------------------
                    Toggle(isOn: $enableNotifications) {
                        Text("Enable Notification")
                    }
                    
                    Toggle(isOn: $backgroundRefresh) {
                        Text("Background Refresh")
                    }
                }
                // Section 2
                Section(header: Text("Application")) {
                    if enableNotifications {
                        HStack {
                            Text("Product").foregroundColor(Color.gray)
                            Spacer()
                            Text("Avocado Recipes")
                        }
                        HStack {
                            Text("Compatability").foregroundColor(Color.gray)
                            Spacer()
                            Text("IPhone / IPad")
                        }
                        HStack {
                            Text("Developer").foregroundColor(Color.gray)
                            Spacer()
                            Text("Seamore Butts")
                        }
                        HStack {
                            Text("Designer").foregroundColor(Color.gray)
                            Spacer()
                            Text("Adam Januszewski")
                        }
                        HStack {
                            Text("Website").foregroundColor(Color.gray)
                            Spacer()
                            Text("ieatavocados.com")
                        }
                        HStack {
                            Text("Version").foregroundColor(Color.gray)
                            Spacer()
                            Text("1.0.0")
                        }
                    } else {
                        HStack {
                            Text("Personal message").foregroundColor(Color.gray)
                            Spacer()
                            Text("Happy Coding!")
                        }
                    }
                }
            }
        }
        .frame(maxWidth: 640)
        
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
