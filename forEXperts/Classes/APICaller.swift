

import Foundation

final class APICaller{
    static let shared = APICaller()
    
    private struct Constants {
        static let apiKey = "D4DCEA9C-7D8E-411C-8372-1182FF203440"
        static let assetsEndpoint = "https://rest.coinapi.io/v1/assets/"
    }
    
    private init() {}
    
    public var icons: [Icon] = []
    
    
    private var whenReadyBlock: ((Result<[Crypto], Error>) -> Void)?
    
    public func getAllCryptoData(
completion: @escaping (Result<[Crypto], Error>) -> Void
    ){
        //check if icons is empty
        guard !icons.isEmpty else {
            whenReadyBlock = completion
            return
        }
        
        
        guard let url = URL(string: Constants.assetsEndpoint + "?apikey=" + Constants.apiKey) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) {data, _, error in
            guard let data = data, error == nil else {
                return
            }
        
        
        do{
            let cryptos = try JSONDecoder().decode([Crypto].self, from: data)
            completion(.success(cryptos))
        }
        
        catch{
            completion(.failure(error))
        }
        
    }
        task.resume()
    }
    
    public func getAllIcons(){
        guard let url = URL(string:"https://rest.coinapi.io/v1/assets/icons/55/?apikey=D4DCEA9C-7D8E-411C-8372-1182FF203440")
        else{
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) {[weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
        
        
        do{
            self?.icons = try JSONDecoder().decode([Icon].self, from: data)
            //if icons are ready, get the data
            if let completion = self?.whenReadyBlock{
                self?.getAllCryptoData(completion: completion)
            }
            
        }
        
        catch{
            print(error)
        }
        
    }
        task.resume()
    }

}
