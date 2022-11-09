//
//  NetworkManager.swift
//  PeopleApp
//
//  Created by Megha Uppin on 09/11/2022.
//

import Foundation

class NetworkManager {
    
    let session : URLSession
   
    
    init(session: URLSession = URLSession.shared){
        self.session = session
    }
}

extension NetworkManager {
    
    func fetchPage(urlStr: String, completion: @escaping (Result<[PeopleData], Error>) -> Void) {

        guard let url = URL(string: urlStr) else {
            completion(.failure(NetworkError.urlFailure))
            return
        }
        
        self.session.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(NetworkError.other(error)))
                return
            }
            if let hResponse = response as? HTTPURLResponse,!(200..<300).contains(hResponse.statusCode){
                completion(.failure(NetworkError.serverResponse(hResponse.statusCode)))
                return
            }
            guard let data = data else {
                    completion(.failure(NetworkError.dataFailure))
                return
            }
            do {
                let Page = try JSONDecoder().decode([PeopleData].self, from: data)
                completion(.success(Page))
            } catch {
                    completion(.failure(NetworkError.decodeError(error)))
            }
        }.resume()
        
    }
    
    
    func fetchRoomData(urlStr: String, completion: @escaping (Result<[RoomData], NetworkError>) -> Void ){
        
        guard let url = URL(string: urlStr) else {
            completion(.failure(NetworkError.urlFailure))
            return
        }
        
        self.session.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(NetworkError.other(error)))
                return
            }
            if let hResponse = response as? HTTPURLResponse,!(200..<300).contains(hResponse.statusCode){
                completion(.failure(NetworkError.serverResponse(hResponse.statusCode)))
                return
            }
            guard let data = data else {
                    completion(.failure(NetworkError.dataFailure))
                return
            }
            do {
                let data = try JSONDecoder().decode([RoomData].self, from: data)
                completion(.success(data))
            } catch {
                    completion(.failure(NetworkError.decodeError(error)))
            }
        }.resume()
        
    }
    
    func fetchImage(urlStr: String, completion: @escaping (Result<Data, NetworkError>) -> Void ){
        
        guard let url = URL(string: urlStr) else {
            completion(.failure(NetworkError.urlFailure))
            return
        }
           
        self.session.dataTask(with: url) { data, response, error in
            
            if let error = error {
                completion(.failure(NetworkError.other(error)))
                return
            }
            
            if let hResponse = response as? HTTPURLResponse,!(200..<300).contains(hResponse.statusCode){
                completion(.failure(NetworkError.serverResponse(hResponse.statusCode)))
                return
            }
            guard let data = data else {
                completion(.failure(NetworkError.dataFailure))
                return
            }
            
            completion(.success(data))
        }.resume()
        
    }
    
}



