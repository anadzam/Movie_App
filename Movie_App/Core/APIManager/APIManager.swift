//
//  APIManager.swift
//  Movie_App
//
//  Created by Ani Dzamelashvili on 11.08.23.
//

import Foundation
import UIKit

class APIManager {
    
    private enum CustomError: Error {
        case invalidResponse
        case invalidData
        case invalidURL
    }
    
    
    let urlString = "https://api-gate2.movieglu.com/filmsNowShowing/?n=10"
    
    func fetchData<T: Codable>(modelType: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
          guard let url = URL(string: urlString) else {
              completion(.failure(CustomError.invalidURL))
              return
          }
          
          request(url: url, expecting: T.self, completion: completion)
      }
   
    //MARK: - Create URL request
    private func request<T: Codable>(url: URL,
                                     expecting: T.Type,
                                     completion: @escaping (Result<T, Error>) -> Void) {
        let configuration = createURLSessionConfiguration()
        
        let session = URLSession(configuration: configuration)
        
        let task = session.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(CustomError.invalidData))
                return
            }
            
            do {
                let responseData = try JSONDecoder().decode(expecting, from: data)
                completion(.success(responseData))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    //MARK: - Create Header for URL
    
    private func createURLSessionConfiguration() -> URLSessionConfiguration {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = [
            "client": "PRAC_3",
            "x-api-key": "4akhPAtp9I7J3ghz1Sw4z6cDtJkAXAOk6651XB5d",
            "authorization": "Basic UFJBQ18zX1hYOkRGQmw3cW5oSWxZNg==",
            "territory": "XX",
            "api-version": "v200",
            "device-datetime": "2023-08-21"
        ]
        return configuration
    }
    
    
}

