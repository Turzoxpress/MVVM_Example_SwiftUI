
import SwiftUI


struct MainModelFetcher: Decodable {
    
    let results : [PopularMovieList]
}

struct PopularMovieList: Identifiable, Decodable {
    
    // We want to have a unique id for our data
    let id = UUID()
    let original_title : String
    let poster_path : String
    
}

struct Parameters: Encodable {
    let api_key: String
    
}


