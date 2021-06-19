//
//  ApiClient.swift
//  AppsPanelSwiftUI
//
//  Created by Jeremy  Bailly  on 19/06/2021.
//

import UIKit

class ApiService {
    
    func loadJson(fromURLString urlString: String, headers: Dictionary<String, String>, completion: @escaping (Result<Data, Error>) -> Void) {
        
        var request = URLRequest(url: URL(string: urlString)!)
        headers.forEach { key, value in
            request.setValue(value, forHTTPHeaderField: key)
        }
        
        let urlSession = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
            }
            
            if let data = data {
                completion(.success(data))
            }
        }
        urlSession.resume()
    }
    
    func parse<T: Codable>(T: T.Type, jsonData: Data) -> T? {
        do {
            return try JSONDecoder().decode(T, from: jsonData)
        } catch {
            print("decode error")
            return nil
        }
    }
    
}
