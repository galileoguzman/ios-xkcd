//
//  ComicsService.swift
//  xkcd
//
//  Created by Galileo Guzman on 15/03/22.
//

import Foundation

class ComicsService {
    
    private let baseURL = URL(string: "https://xkcd.com/")!
    
    init() {}
    
    func getLatestComic(_ completed: @escaping(Result<ComicModel, NetworkError>) -> Void) {
        
        guard let url = baseURL.appendingPathComponent("info.0.json") as URL? else {
            completed(.failure(.unableToComplete))
            return
        }
        
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        
        let request = URLRequest(url, method: .GET)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
        
            if let _ = error{
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let serverResponse = response as? HTTPURLResponse,
                  serverResponse.statusCode == 200 else {
                completed(.failure(.serviceUnavailable))
                return
            }

            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }

            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                
                let comic = try decoder.decode(ComicModel.self, from: data)
                completed(.success(comic))
            } catch {
                completed(.failure(.invalidData))
            }
        }

        task.resume()
    }
    
    func getComicWith(number: Int, completed:  @escaping(Result<ComicModel, NetworkError>) -> Void) {
        
        guard let url = baseURL.appendingPathComponent("\(number)/info.0.json") as URL? else {
            completed(.failure(.unableToComplete))
            return
        }
        
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        
        let request = URLRequest(url, method: .GET)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
        
            if let _ = error{
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let serverResponse = response as? HTTPURLResponse, serverResponse.statusCode == 200 else {
                completed(.failure(.serviceUnavailable))
                return
            }

            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }

            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                
                let comic = try decoder.decode(ComicModel.self, from: data)
                completed(.success(comic))
            } catch {
                completed(.failure(.invalidData))
            }
        }

        task.resume()
    }
}
