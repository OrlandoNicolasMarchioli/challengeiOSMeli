//
//  ProductApi.swift
//  ChallengeiOSMeli
//
//  Created by Nico on 14/06/2024.
//

import Foundation

protocol ProductsApiProtocol{
    func getAllProducts(productName: String,completion: @escaping (Response?, Error?) -> Void)
}

class ProductApi: ProductsApiProtocol{
    
    static private var shared: ProductApi?
    private var products: [Product] = []
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
    
    func getAllProducts(productName: String,completion: @escaping (Response?, Error?) -> Void) {
        guard let urlRequest = absoluteURLFactory(host: baseUrl,
                                                  path: "ites/MLA/search?q=",
                                                   param: productName) else{
            print("Invalid Url")
            return
        }
        
        performDataTask(urlRequest: urlRequest , completion: completion, decodingType: Response.self, extractResponse: extractProductsFromResponse(response: ))

    }
    

    private func performDataTask<T: Decodable>(urlRequest: URLRequest, completion: @escaping (T?, Error?) -> Void, decodingType: T.Type, extractResponse: @escaping (T) -> Void) {
         
        urlSession.dataTask(with: urlRequest) { data, _, error in
             guard let data = data, error == nil else {
                 print("Error fetching data: \(error?.localizedDescription ?? "Unknown error")")
                 DispatchQueue.main.async {
                     completion(nil, error)
                 }
                 return
             }
             
             do {
                 let decoder = JSONDecoder()
                 let response = try decoder.decode(decodingType, from: data)
                 extractResponse(response)
                 DispatchQueue.main.async {
                     completion(response, nil)
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
      var urlRequest = URLRequest(url: hostUrl ?? URL(fileURLWithPath: ""))
      urlRequest.httpMethod = "GET"

      return  urlRequest
    }
    
    private func extractProductsFromResponse(response: Response) -> Void{
            self.products = response.results
    }
    

    
}
