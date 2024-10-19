//
//  FlightDetail.swift
//  Flights
//
//  Created by Renata Albuquerque on 19/10/24.
//

import Foundation
import SwiftUI

struct FlightDetail: View {
    let flight: Flight
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Flight Number: \(flight.flightNumber)")
                .font(.largeTitle)
                .bold()
            
            Text("Airline: \(flight.airline)")
                .font(.title2)
            
            HStack {
                VStack(alignment: .leading) {
                    Text("Origin:")
                        .font(.headline)
                    Text("\(flight.origin.city) (\(flight.origin.airportCode))")
                    Text("Terminal: \(flight.origin.terminal)")
                    Text("Gate: \(flight.origin.gate)")
                    Text("Departure: \(flight.origin.departureTime ?? "N/A")")
                }
                Spacer()
                VStack(alignment: .leading) {
                    Text("Destination:")
                        .font(.headline)
                    Text("\(flight.destination.city) (\(flight.destination.airportCode))")
                    Text("Terminal: \(flight.destination.terminal)")
                    Text("Gate: \(flight.destination.gate)")
                    Text("Arrival: \(flight.destination.arrivalTime ?? "N/A")")
                }
            }
            
            Text("Duration: \(flight.duration)")
                .font(.title3)
            
            Spacer()
        }
        .padding()
        .navigationTitle("Flight Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

