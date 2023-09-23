//
//  NetworkManager.swift
//  Yummy
//
//  Created by Dmytro Nimchynskyi on 23/09/2023.
//

import Foundation

// Singleton
final class NetworkManager {
    
    static let shared = NetworkManager()
    
    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    private let mealsURL = baseURL + "appetizers"
    
    private init() {}
    
    func getMeals(completed: @escaping (Result<[Meal], YummyError>) -> Void) {
        guard let url = URL(string: mealsURL) else {
            completed(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            // now i have data past all these checks
            
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(MealResponse.self, from: data)
                completed(.success(decodedResponse.request))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
}
