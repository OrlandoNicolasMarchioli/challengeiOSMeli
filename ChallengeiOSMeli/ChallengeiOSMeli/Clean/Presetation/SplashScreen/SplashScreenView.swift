//
//  SplashScreenView.swift
//  ChallengeiOSMeli
//
//  Created by Nico on 14/06/2024.
//

import SwiftUI

struct SplashScreenView: View {
    var body: some View {
        ZStack{
            VStack{
                Image("splashScreenLogo")
                    .resizable()
                    .frame(maxWidth: 350,maxHeight: 350)
            }
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
