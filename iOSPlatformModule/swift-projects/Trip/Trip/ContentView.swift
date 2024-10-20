//
//  ContentView.swift
//  Trip
//
//  Created by Renata Albuquerque on 20/10/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            ZStack{
                BgStyle()

                VStack {
                    Spacer()
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundColor(.black)
                    Spacer()
                    NavigationLink(destination: Destinations()){
                        RoundedRectangle(cornerRadius: 15)
                            .overlay(content: {
                                Text("Entrar")
                                    .foregroundStyle(.black)
                            }).frame(width: 120, height: 60)
                    }
                    Spacer()
                }.tint(.white)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
