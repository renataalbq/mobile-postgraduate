//
//  ContentView.swift
//  SevenWonders
//
//  Created by Renata Albuquerque on 19/10/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ForEach(places){ place in
                VStack(alignment: .leading){
                    NavigationLink(destination: Details(placeClicked: place), label: {
                        HStack(alignment: .center) {
                            AsyncImage(url: URL(string: place.img),
                                content: { image in image.resizable()
                                .scaledToFit() },
                                placeholder: { ProgressView() })
                            Spacer()
                            Text(place.name)
                            Spacer()
                        }
                    })
                    
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
