
import SwiftUI
import SDWebImageSwiftUI

struct ExampleView: View {
    @ObservedObject var popularMoviewFetcherVM = MovieViewModel()
    
    private var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        
        
        
        ScrollView(.vertical, showsIndicators: false) {
          LazyVGrid(columns: gridItemLayout, spacing: 20) {
            ForEach(popularMoviewFetcherVM.results, id: \.id) { movie in
                
                
                VStack(alignment: .center, spacing: 5){
                    
                    VStack{
                        
                        
                        WebImage(url: URL(string: popularMoviewFetcherVM.imageServerURL+movie.poster_path))
                            // Supports options and context, like `.delayPlaceholder` to show placeholder only when error
                            .onSuccess { image, data, cacheType in
                                // Success
                                // Note: Data exist only when queried from disk cache or network. Use `.queryMemoryData` if you really need data
                            }
                            .resizable() // Resizable like SwiftUI.Image, you must use this modifier or the view will use the image bitmap size
                            .placeholder(Image("placeholder")) // Placeholder Image
                            // Supports ViewBuilder as well
                            
                            .indicator(.activity) // Activity Indicator
                            //.transition(.fade(duration: 0.5)) // Fade Transition with duration
                            .scaledToFit()

                        
                    }
                   
                    
                    
                    VStack{
                        
                        Text(movie.original_title)
                            .font(.custom("Helvetica Neue", size: 12))
                    }
                    
                }
                
                
       
              }
             
              
            }
          .padding([.top,.bottom], 50)
          .padding([.leading, .trailing],20)
        }.onAppear(perform: {
            popularMoviewFetcherVM.FetchApiData()
        })
        
       

        
    }
}

struct ExampleView_Previews: PreviewProvider {
    static var previews: some View {
        ExampleView()
    }
}
