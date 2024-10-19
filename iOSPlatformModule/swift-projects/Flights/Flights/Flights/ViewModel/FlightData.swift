//
//  FlightData.swift
//  Flights
//
//  Created by Renata Albuquerque on 19/10/24.
//

import Foundation

class FlightData : ObservableObject {
    @Published var flights : [Flight] = []
    
    func fetchData(){
        let url = URL(string: "https://mocki.io/v1/e5ea59b7-79de-4e52-a9cd-5cba68e1583a")
        let task = URLSession.shared.dataTask(with: url!){
            data, response, error in
            do {
                self.flights = try JSONDecoder().decode([Flight].self, from: data!)
            } catch {
                print(error)
            }
        }
        task.resume()
    }
}
