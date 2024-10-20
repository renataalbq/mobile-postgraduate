//
//  BgStyle.swift
//  Trip
//
//  Created by Renata Albuquerque on 20/10/24.
//

import SwiftUI

struct BgStyle: View {
    var body: some View {
        ZStack{
            Color.black
                .ignoresSafeArea()
            
            RadialGradient(
                gradient: Gradient(colors: [.black, .blue]),
                center: .topLeading,
                startRadius: 0,
                endRadius: 300
            )
            .opacity(0.7)
            .ignoresSafeArea()

            RadialGradient(
                gradient: Gradient(colors: [.gray, .cyan]),
                center: .bottomTrailing,
                startRadius: 0,
                endRadius: 400
            )
            .opacity(0.5)
            .ignoresSafeArea()
        }
    }
}

struct BgStyle_Previews: PreviewProvider {
    static var previews: some View {
        BgStyle()
    }
}
