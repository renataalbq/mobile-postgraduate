//
//  Point.swift
//  Trip
//
//  Created by Renata Albuquerque on 20/10/24.
//

import Foundation

struct Point : Decodable, Identifiable{
    var id = UUID()
    var rev: String
    var name: String
    var lat: Double
    var long: Double
    var urlPhoto: String
    var text: String
}
