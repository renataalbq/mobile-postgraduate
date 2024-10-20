//
//  Destinations.swift
//  Trip
//
//  Created by Renata Albuquerque on 20/10/24.
//

import Foundation
import SwiftUI

struct Destinations: View {
    @StateObject var pointsViewModel = ViewModel()
    @State var modal = false
    @State var point = Point()
    
    var body: some View {
        ZStack {
            BgStyle()
            VStack{
                ScrollView{
                    ForEach(pointsViewModel.points){
                        p in NavigationLink(destination: DestinationsDetail(clicked: p)){
                            ZStack{
                                Color.black
                                    .opacity(0.5)
                                HStack{
                                    AsyncImage(url: URL(string: p.urlPhoto), content: {
                                        image in image
                                            .scaledToFill()
                                            .frame(maxWidth: 90, maxHeight: 90)
                                            .clipped()
                                    }, placeholder: {
                                        Image("404")
                                            .resizable()
                                            .scaledToFill()
                                            .frame(maxWidth: 90, maxHeight: 90)
                                            .clipped()
                                        
                                    })
                                    Spacer()
                                    VStack{
                                        Text(p.name)
                                            .foregroundColor(.white)
                                    }
                                    Spacer()
                                    Image(systemName: "checkmark.circle")
                                        .foregroundColor(.white)
                                }.padding(.horizontal, 15)
                            }.frame(height: 120)
                        }
                    }
                    Spacer()
                }

            }
            .onAppear(){
                pointsViewModel.fetch()
            }.sheet(isPresented: $modal, content: {
                SheetPoint(instance: pointsViewModel, point: $point)
            })
            .navigationTitle("Meus Locais")
            .toolbar{Button(action: {
                modal = true
            }, label: {
                Image(systemName: "plus")
            })
            }
        }.tint(.white)
    }
}
