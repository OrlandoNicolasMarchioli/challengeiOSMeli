//
//  ProductApi.swift
//  ChallengeiOSMeli
//
//  Created by Nico on 14/06/2024.
//

import Foundation

protocol ProductsApiProtocol{
    func getAllProducts(productName: String,completion: @escaping ([String: Any]?, Error?) -> Void)
}

class ProductApi: ProductsApiProtocol{
    
    static private var shared: ProductApi?
    private var urlSession: URLSession
    private var baseUrl: String
    
    init(urlSession: URLSession = URLSession.shared, baseUrl: String) {
        self.urlSession = urlSession
        self.baseUrl = baseUrl
    }
    
    static func getInstance() -> ProductsApiProtocol{
        if let returnShared = shared{
            return shared ?? returnShared
        }else{
            let newInstance =
            ProductApi(baseUrl: ProcessInfo.processInfo.environment["baseUrl"] ?? "")
            shared = newInstance
            return shared ?? newInstance
        }
    }
    
    func getAllProducts(productName: String,completion: @escaping ([String: Any]?, Error?) -> Void) {
        guard let urlRequest = absoluteURLFactory(host: baseUrl,
                                                          path: "sites/MLA/search",
                                                          param: productName) else{
                    print("Invalid Url")
                    return
                }
        print(urlRequest)
        
        performDataTask(urlRequest: urlRequest , completion: completion)

    }
    

    private func performDataTask(urlRequest: URLRequest, completion: @escaping ([String: Any]?, Error?) -> Void) {
        urlSession.dataTask(with: urlRequest) { data, _, error in
            guard let data = data, error == nil else {
                print("Error fetching data: \(error?.localizedDescription ?? "Unknown error")")
                DispatchQueue.main.async {
                    completion(nil, error)
                }
                return
            }
            
            do {
                if let jsonResponse = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                    completion(jsonResponse, nil)
                } else {
                    throw NSError(domain: "Invalid JSON format", code: 100, userInfo: nil)
                }
            } catch {
                print("Error decoding data: \(error.localizedDescription)")
                DispatchQueue.main.async {
                    completion(nil, error)
                }
            }
        }.resume()
    }
    
    private func absoluteURLFactory(host: String, path: String, param: String) -> URLRequest?{
          var hostUrl = URL(string: host)
          hostUrl?.append(path: path)
          hostUrl?.append(queryItems: [URLQueryItem(name: "q", value: param)])
          print(hostUrl ?? "")
          var urlRequest = URLRequest(url: hostUrl ?? URL(fileURLWithPath: ""))
          urlRequest.httpMethod = "GET"
          return  urlRequest
        }
}
