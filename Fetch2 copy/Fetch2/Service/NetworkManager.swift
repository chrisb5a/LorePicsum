//
//  NetworkManager.swift
//  Fetch2
//
//  Created by Consultant on 7/11/22.
//

import Foundation


final class NetworkManager {
    
    static let shared: NetworkManager = NetworkManager()
    
    private let session: URLSession
    
    private init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
//    init(session: URLSession = URLSession.shared) {
//        self.session = session
//    }
    
    func getData(url: URL?, completion: @escaping (Result<Data, NetworkError>) -> Void) {
        
        guard let url = url else {
            completion(.failure(NetworkError.badURL))
            return
        }

        self.session.dataTask(with: url) { data, response, error in
            
            if let error = error {
                completion(.failure(NetworkError.other(error)))
                return
            }
            
            guard let data = data else {
                completion(.failure(NetworkError.badData))
                return
            }
            
//            guard let response = (response as? HTTPURLResponse)?.allHeaderFields["picsum-id"] else {
//                completion(.failure(NetworkError.badData))
//                return
//            }
            let response = "\(String(describing: (response as?HTTPURLResponse)?.allHeaderFields["picsum-id"]))"
            completion(.success(data))
            
            print(response)
            
            print("\(String(describing: URLRequest(url:URL(string: "https://picsum.photos/200/300")!  )))")
            
            
            
            
//            print((response as? HTTPURLResponse)?.allHeaderFields["picsum-id"])
            //print(response)
        }.resume()
        
        
        
    }
    
    
}
