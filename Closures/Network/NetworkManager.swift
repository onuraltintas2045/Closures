//
//  NetworkManager.swift
//  Closures
//
//  Created by Onur Altintas on 16.05.2025.
//

import Foundation


class NetworkManager {
    
    //Proje başlatıldığında 1 kez networkManager oluşturulur böylece her seferinde yeni bir nesne oluşturmaya gerek kalmaz
    static let shared = NetworkManager()
    //Private init kullanıldığı için bu sınıfa yalnızca shared üzerinden erişilebilir hale getirdik.
    //Böylece gereksiz yere NetworkManager sınıfı oluşturulmuyor.
    private init() {}
    
    func fetchData(completion: @escaping (Result<[User],Error>) -> Void) {
        guard let url = URL(string: "https://randomuser.me/api/?results=10") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
            }
            
            guard let data = data else {
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode(UserResponse.self, from: data)
                completion(.success(decodedData.results))
            } catch {
                print("Decoding error: \(error)")
            }
            
        }.resume()
    }
}
