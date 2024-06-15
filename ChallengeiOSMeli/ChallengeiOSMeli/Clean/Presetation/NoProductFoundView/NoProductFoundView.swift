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
                Image(systemName: "movieclapper")
                    .resizable()
                    .frame(maxWidth: 200, maxHeight: 200)
                    .foregroundColor(.red)
                Text("No movies found")
                    .foregroundColor(.red)
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
