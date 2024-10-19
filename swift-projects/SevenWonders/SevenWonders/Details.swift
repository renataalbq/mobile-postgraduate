//
//  Details.swift
//  SevenWonders
//
//  Created by Renata Albuquerque on 19/10/24.
//

import SwiftUI

struct Details: View {
    var placeClicked : Place
    var body: some View {
        VStack{
            Text(placeClicked.name)
            AsyncImage(url: URL(string: placeClicked.img),
                content: { image in image.resizable()                .scaledToFit()
            }, placeholder: {
                ProgressView()
            })
            Text(placeClicked.desc)
        }
    }
}

struct Details_Previews: PreviewProvider {
    static var previews: some View {
        Details(placeClicked: Place(name: "", img: "", desc: ""))
    }
}
