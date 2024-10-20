//
//  SheetPoint.swift
//  Trip
//
//  Created by Renata Albuquerque on 20/10/24.
//

import SwiftUI
import MapKit

struct SheetPoint: View {
    @ObservedObject var instance: ViewModel
    @Binding var point: Point
    
    @State private var mapRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.3349, longitude: -22.4194),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )
    
    @State private var name: String = ""
    @State private var link: String = ""
    @State private var desc: String = ""
    @State private var lat: Double
    @State private var long: Double

    var body: some View {
        ZStack {
            BgStyle()
            VStack {
                Text(point.id == nil ? "Criar País" : "Editar País")
                
                Form {
                    Section(header: Text("Informações")) {
                        TextField("Nome", text: $name)
                        TextField("Link", text: $link)
                            .autocapitalization(.none)
                    }
                    Section(header: Text("Lat & Long")) {
                        TextField("Lat", value: $lat, formatter: NumberFormatter())
                        TextField("Long", value: $long, formatter: NumberFormatter())
                    }
                    Section(header: Text("Descrição")) {
                        TextField("Descrição", text: $desc)
                    }
                    Section {
                        Button("Salvar") {
                            if point.id == nil {
                                self.point = Point(
                                    id: UUID(),
                                    rev: "",
                                    name: name,
                                    lat: lat,
                                    long: long,
                                    urlPhoto: link,
                                    text: desc
                                )
                                instance.create(point)
                            } else {
                                self.point = Point(
                                    id: point.id,
                                    rev: point.rev,
                                    name: name,
                                    lat: lat,
                                    long: long,
                                    urlPhoto: link,
                                    text: desc
                                )
                                instance.update(point)
                            }
                        }
                    }
                }
            }
            .onAppear {
                name = point.name
                link = point.urlPhoto
                desc = point.text
                lat = point.lat
                long = point.long
            }
        }
    }
}
