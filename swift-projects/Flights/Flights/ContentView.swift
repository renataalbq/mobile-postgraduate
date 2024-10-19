//
//  ContentView.swift
//  Flights
//
//  Created by Renata Albuquerque on 19/10/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var data = FlightData()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    ForEach(data.flights) { flight in
                        NavigationLink(destination: FlightDetail(flight: flight)) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color.white)
                                    .shadow(radius: 5)
                                    .padding(.horizontal, 10)
                                
                                VStack(alignment: .leading) {
                                    HStack {
                                        Text(flight.flightNumber)
                                            .font(.headline)
                                            .foregroundColor(.gray)
                                        Spacer()
                                        Text(flight.status)
                                            .font(.subheadline)
                                            .bold()
                                            .padding(5)
                                            .background(Color.blue.opacity(0.2))
                                            .cornerRadius(10)
                                    }
                                    .padding(.bottom, 5)
                                    
                                    HStack {
                                        VStack(alignment: .leading) {
                                            Text(flight.origin.city)
                                                .font(.title3)
                                                .bold()
                                                .foregroundColor(.primary)
                                        }
                                        Spacer()
                                        Image(systemName: "airplane")
                                            .font(.title2)
                                            .foregroundColor(.blue)
                                        Spacer()
                                        VStack(alignment: .trailing) {
                                            Text(flight.destination.city)
                                                .font(.title3)
                                                .bold()
                                                .foregroundColor(.primary)
                                        }
                                    }
                                }
                                .padding()
                            }
                            .padding(.vertical, 5)
                        }
                    }
                }
                .onAppear() {
                    data.fetchData()
                }
                .padding()
                .background(Color(.systemGroupedBackground))
            }
            .navigationTitle("Flights")
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
