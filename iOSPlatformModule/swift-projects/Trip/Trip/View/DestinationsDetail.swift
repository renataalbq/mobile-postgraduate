//
//  DestinationsDetail.swift
//  Trip
//
//  Created by Renata Albuquerque on 20/10/24.
//

import Foundation
import SwiftUI

struct DestinationsDetail: View {
    @State var clicked : Point
    @State var mapSheet = false
    @State var editSheet = false
    
    @StateObject var pointsViewModel = ViewModel()
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        ZStack {
            BgStyle()
            VStack{
                MapView(lat: clicked.lat, long: clicked.long)
                    .frame(height: 200)
                    .clipped().onTapGesture {
                        mapSheet = true
                    }
                
                ImageClipCircle(image: clicked.urlPhoto)
                    .offset(y: -80)
                    .padding(.bottom, -80)
                ScrollView{
                    Text(clicked.text)
                        .multilineTextAlignment(.center)
                        .padding()
                }
            }.navigationTitle(clicked.name)
                .toolbar{
                    Button(action: {
                        editSheet = true
                    }, label: {
                        Image(systemName: "pencil")
                    })
                    Button(action: {
                        pointsViewModel.remove(clicked)
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "trash")
                    })
                }
                .sheet(isPresented: $mapSheet, content: {
                    Divider()
                    MapView(lat: clicked.lat, long: clicked.long)
                })
                .sheet(isPresented: $editSheet, content: {
                    Divider()
                    SheetPoint(instance: pointsViewModel, point: $clicked)
                })
        }
    }
}
