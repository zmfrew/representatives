//
//  RepresentativeController.swift
//  Representatives
//
//  Created by Zachary Frew on 7/18/18.
//  Copyright © 2018 Zachary Frew. All rights reserved.
//

import Foundation

class RepresentativeController {
    
    // MARK: - Properties
    static let baseURL = URL(string: "https://whoismyrepresentative.com/getall_reps_bystate.php")!
    
    // MARK: - Methods
    func searchRepresentatives(forState state: String, completion: @escaping (([Representative]) -> Void)) {
        guard var components = URLComponents(url: RepresentativeController.baseURL, resolvingAgainstBaseURL: true) else { completion([]); return}
        
        let stateQuery = URLQueryItem(name: "state", value: state)
        let outputQuery = URLQueryItem(name: "output", value: "json")
        components.queryItems = [stateQuery, outputQuery]
        
        guard let url = components.url else { completion([]); return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.httpBody = nil
        
        URLSession.shared.dataTask(with: request) { (data, _, error) in
            if let error = error {
                print("Error occurred with retrieving data: \(error.localizedDescription)")
                completion([])
                return
            }
            
            guard let data = data, let responseData = String(data: data, encoding: .ascii), let convertedData = responseData.data(using: .utf8) else {
                print("Error occurred with data being nil.")
                completion([])
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let resultsDictionary = try decoder.decode([String: [Representative]].self, from: convertedData)
                guard let representatives = resultsDictionary["results"] else { completion([]); return }
                completion(representatives)
            } catch {
                print("Error occurred with decoding: \(error.localizedDescription)")
                completion([])
            }
            
        }.resume()
    }
    
}
