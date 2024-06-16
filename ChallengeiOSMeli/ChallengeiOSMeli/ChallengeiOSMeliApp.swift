//
//  ChallengeiOSMeliApp.swift
//  ChallengeiOSMeli
//
//  Created by Nico on 14/06/2024.
//

import SwiftUI

@main
struct ChallengeiOSMeliApp: App {
    @StateObject var navigationManager = NavigationManager.shared()
    
    var body: some Scene {
        WindowGroup {
            ZStack{
                switch navigationManager.state{
                case .allProducts:
                    MainView()
                case .splash:
                    SplashScreenView()
                case .admin:
                    EmptyView()
                case .user:
                    EmptyView()
                }
            }.onAppear(){
                if(navigationManager.state == .splash){
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        navigationManager.onAppInit()
                    }
                }else{
                    navigationManager.onAppInit()
                }
            }
        }
    }
}
