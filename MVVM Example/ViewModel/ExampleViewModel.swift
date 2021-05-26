
import SwiftUI
import Alamofire

class MovieViewModel: ObservableObject {
    
    
    let mainServerURL = "https://api.themoviedb.org/3/movie/popular?api_key=0ca2f1cf8f508f5c8b381ac091438d5c"
    let imageServerURL = "https://image.tmdb.org/t/p/w500/"
    
    @Published var results = [PopularMovieList]()
    
    
    func FetchApiData(){
        
        AF.request(mainServerURL).response { response in
            
            do {
                
                let decodedResponse  = try JSONDecoder().decode(MainModelFetcher.self, from: response.data!)
                
                print(decodedResponse)
                
                for x in decodedResponse.results {
                    
                
                    print("Value \(x.original_title) Not Found")
                }
                
                self.results = decodedResponse.results
                
                //print(decodedResponse)
                
            } catch DecodingError.keyNotFound(let key, let context) {
                Swift.print("could not find key \(key) in JSON: \(context.debugDescription)")
            } catch DecodingError.valueNotFound(let type, let context) {
                Swift.print("could not find type \(type) in JSON: \(context.debugDescription)")
            } catch DecodingError.typeMismatch(let type, let context) {
                Swift.print("type mismatch for type \(type) in JSON: \(context.debugDescription)")
            } catch DecodingError.dataCorrupted(let context) {
                Swift.print("data found to be corrupted in JSON: \(context.debugDescription)")
            } catch let error as NSError {
                NSLog("Error in read(from:ofType:) domain= \(error.domain), description= \(error.localizedDescription)")
            }
            
           
        }
    }
}
