//
//  ImageClipCircle.swift
//  Trip
//
//  Created by Renata Albuquerque on 20/10/24.
//

import SwiftUI

struct ImageClipCircle: View {
    var image: String

    var body: some View {
        AsyncImage(url: URL(string: image)) { p in
            if let image = p.image {
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 150, height: 150)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                    .shadow(radius: 10)
            } else if p.error != nil {
                Color.red
                    .frame(width: 150, height: 150)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                    .shadow(radius: 10)
            } else {
                ProgressView()
                    .frame(width: 150, height: 150)
            }
        }
    }
}

struct ImageClipCircle_Previews: PreviewProvider {
    static var previews: some View {
        ImageClipCircle(image: "https://via.placeholder.com/150")
    }
}
