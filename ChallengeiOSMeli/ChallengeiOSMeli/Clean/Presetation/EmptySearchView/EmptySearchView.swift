//
//  EmptySearchView.swift
//  ChallengeiOSMeli
//
//  Created by Nico on 15/06/2024.
//

import SwiftUI

struct EmptySearchView: View {
    var body: some View {
        ZStack{
            VStack{
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .frame(maxWidth: 200, maxHeight: 200)
                    .foregroundColor(.yellow)
                Text("Search your product")
                    .foregroundColor(.yellow)
                    .bold()
            }
        }
    }
}

#Preview {
    EmptySearchView()
}
