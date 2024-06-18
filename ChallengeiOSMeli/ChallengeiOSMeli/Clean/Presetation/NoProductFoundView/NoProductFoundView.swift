//
//  NoProductFoundView.swift
//  ChallengeiOSMeli
//
//  Created by Nico on 14/06/2024.
//

import SwiftUI

struct NoProductFoundView: View {
    var body: some View {
        ZStack{
            VStack{
                Image(systemName: "message")
                    .resizable()
                    .frame(maxWidth: 200, maxHeight: 200)
                    .foregroundColor(Color("yellowMeli"))
                Text("No products found")
                    .foregroundColor(Color("yellowMeli"))
                    .bold()
            }
        }
    }
}

struct NoProductFoundView_Previews: PreviewProvider {
    static var previews: some View {
        NoProductFoundView()
    }
}
