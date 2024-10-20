//
//  ViewModel.swift
//  Trip
//
//  Created by Renata Albuquerque on 20/10/24.
//

import Foundation

class ViewModel : ObservableObject{
    @Published var points : [Point] = []
    
    func fetch(){
        guard let url = URL(string: "http://127.0.0.1:8080/paises") else{
                return
            }
        let task = URLSession.shared.dataTask(with: url){
            [weak self] data, response, error in
            guard let data = data, error == nil else{
                return
            }
            
            do {
                let parsed = try JSONDecoder().decode([Point].self, from: data)
                
                DispatchQueue.main.async {
                    self?.points = parsed
                }
            }catch{
                print(error)
            }
        }
        task.resume()
    }
    
    func remove(_ obj : Point){
        guard let url = URL(string: "http://127.0.0.1:8080/remover") else{
                return
            }
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
            
        do {
            let data = try JSONEncoder().encode(obj)
            request.httpBody = data
            }catch{
                print(error)
            }
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print(error)
                return
            }
            print(data)
        }
        task.resume()
        self.fetch()
    }
    
    func create(_ obj : Point){
        guard let url = URL(string: "http://127.0.0.1:8080/criar") else{
                return
            }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let jsonData = try JSONEncoder().encode(obj)
            request.httpBody = jsonData
        } catch{
            print(error)
        }
        let task = URLSession.shared.dataTask(with: request){
            data, response, error in
            guard let data = data, error == nil else{
                return
            }
        }
        task.resume()
        self.fetch()
    }
    
    func update(_ obj : Point){
        guard let url = URL(string: "http://127.0.0.1:8080/atualizar") else{
                return
            }
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do{
            let jsonData = try JSONEncoder().encode(obj)
            request.httpBody = jsonData
        }catch{
            print(error)
        }
        
        let task = URLSession.shared.dataTask(with: request){
            [weak self] data, response, error in
            guard let data = data, error == nil else{
                return
            }
            
        }
        task.resume()
        self.fetch()
    }
    
}
