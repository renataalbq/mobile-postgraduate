//
//  Flight.swift
//  Flights
//
//  Created by Renata Albuquerque on 19/10/24.
//

import Foundation

struct Flight: Identifiable, Decodable {
    let id = UUID()
    let flightNumber: String
    let airline: String
    let origin: Location
    let destination: Location
    let duration: String
    let status: String
    let aircraft: Aircraft
    
    struct Location: Decodable {
        let city: String
        let airportCode: String
        let departureTime: String?
        let arrivalTime: String?
        let terminal: String
        let gate: String
    }
    
    struct Aircraft: Decodable {
        let model: String
        let seatingCapacity: Int
    }
}
