//
//  MapView.swift
//  Trip
//
//  Created by Renata Albuquerque on 20/10/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    var lat : Double
    var long : Double
    
    @State var teste = false
    @State var pais = ""
    @StateObject var pointsViewModel = ViewModel()

    var body: some View {
        
        Map(initialPosition:
                .region(region), interactionModes: [.rotate,
                       .zoom, .pitch, .pan]){
                           ForEach(pointsViewModel.points){ p in
                               Annotation(p.name, coordinate:
                                            CLLocationCoordinate2D(latitude: p.lat, longitude: p.long),
                                          content: {
                                   Circle().onTapGesture {
                                       pais = p.name
                                       teste = true
                                   }
                               })
                           }
                       }.sheet(isPresented: $teste, content: {
                           Text(pais)
                       }).mapStyle(.hybrid(elevation: .realistic))
    }
    
    private var region: MKCoordinateRegion {
        MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: lat, longitude: long), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(lat: 52.5200, long: 13.4050)
    }
}
