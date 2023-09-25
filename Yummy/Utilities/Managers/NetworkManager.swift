//
//  NetworkManager.swift
//  Yummy
//
//  Created by Dmytro Nimchynskyi on 23/09/2023.
//

import UIKit

// Singleton
final class NetworkManager {
    
    static let shared = NetworkManager()
    private let cache = NSCache<NSString, UIImage>() // cache takes KEY(NSString) and OBJECT(UIImage)
    
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

    
    func downloadImage(fromURLString urlString: String, completed: @escaping (UIImage?) -> Void) {
        
        let cacheKey = NSString(string: urlString)
        
        // if in cache, get it and retuen
        if let image = cache.object(forKey: cacheKey) {
            completed(image)
            return
        }
        
        // if URL is bad, return
        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }
        
        // if not in cache and URL is good, continue getting from URL
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            
            // if we can get good data, we can create image from that data, if not - return
            guard let data = data, let image = UIImage(data: data) else {
                completed(nil)
                return
            }
            
            // cache retrieved image for future use
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
        }
        
        task.resume()
    }
}
