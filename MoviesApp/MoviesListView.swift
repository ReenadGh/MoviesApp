//
//  MoviesListView.swift
//  MoviesApp
//
//  Created by Reenad gh on 15/04/1444 AH.
//

import SwiftUI

struct MoviesListView: View {
   
    @Namespace var namespace
    @State var showMovieView : Bool = false
    @State var movies : [Movie] = [.init(title: "Movie 1 title", year: "2020", imdbId: "Movie", poster: "movie1") , .init(title: "Movie 2 title", year: "2020", imdbId: "Movie", poster: "movie1") , .init(title: "Movie 3 title", year: "2021", imdbId: "Movie", poster: "movie1")]
    @State var searchtext : String = ""
    
    @State var currentMovie : Movie  = .init(title: "", year: "", imdbId: "", poster: "")
    var body: some View {
        if (!showMovieView){
        VStack {
            
            Text("Movies")
                .font(.largeTitle.bold())
                .foregroundColor(.white)
                .multilineTextAlignment(.leading)
                .frame(maxWidth : .infinity , alignment: .leading)
                .padding()
                .padding(.top)
                .padding(.leading)
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.white)
                TextField(" Search", text: $searchtext)
                    .font(.system(size: 20).bold())
                    .foregroundColor(.white)
                
            
            }
            .padding(13)
            .overlay(
            
                RoundedRectangle(cornerRadius: 20).stroke(
                    
                        LinearGradient(colors: [.blue.opacity(0.35) , .purple.opacity(0.5)], startPoint: .topTrailing, endPoint: .bottomLeading)
                        ,lineWidth: 1
                )
          

                    
            
            )
//            .background(
//                Color.darkBackground
//            )
        .padding(.horizontal , 30)

            ScrollView {
                ForEach($movies , id : \.self ) { $movie in
                    MovieCardView(namespace: namespace, movie: $movie)
                        .onTapGesture {
                            currentMovie = movie
                            withAnimation (.spring(response: 0.7, dampingFraction: 1)){
                            showMovieView.toggle()
                            }
                        }
                }
            }
            
        }
        .background(
            
            
            ZStack {
                Color.darkBackground
                LinearGradient(colors: [.blue.opacity(0.2)  ,.pink.opacity(0.1), .purple.opacity(0.4)], startPoint: .topTrailing, endPoint: .bottomLeading)
                Blur(style: .dark)

            }
                .ignoresSafeArea()
        )
        }else {
            MovieDetailViewBlur(namespace: namespace, movie: $currentMovie, showMovieView: $showMovieView)
        }
            
    }
}

struct MoviesListView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesListView()
    }
}

struct MovieCardView: View {
    var namespace : Namespace.ID
    @Binding var movie : Movie
    var body: some View {
        
        RoundedRectangle (cornerRadius: 20)
            .frame( height: 150 )
            .foregroundColor(Color.clear)

            .cornerRadius(12)
        
            .overlay(
            
                
                VStack (spacing : 0 ) {
        
        
        
        
                    HStack {
                        Image(movie.poster)
                            .resizable()
                            .scaledToFit()
                            .frame( height: 150)
                            .cornerRadius(20)
                            .shadow(color: Color.black.opacity(0.2), radius: 12, x: 5, y: 10)

                            .matchedGeometryEffect(id: movie.getId(type: .poster), in: namespace)
                        VStack (alignment: .leading, spacing: 5){
                            Text(movie.title)
                                .font(.title3.bold())
                                .matchedGeometryEffect(id: movie.getId(type: .title), in: namespace)
                            
                            
                            Text("star War movie star War movie star War movie star War movie star War movie star War movie star War movie star War movie")
                                 .font(.system(size: 10))
                                  .lineLimit(1)
                        .matchedGeometryEffect(id: movie.getId(type: .desc), in: namespace)
                            HStack{
        
                                ForEach(0 ..< 5) { item in
                                    Image(systemName: "star.fill")
                                        .foregroundColor(.yellow)
                                        .shadow(color: Color.black.opacity(1), radius: 12, x: 3, y: 10)
        
        
                                }
        
                            }
                            .matchedGeometryEffect(id: movie.getId(type: .stars), in: namespace)
        
                        }
                            .frame(maxWidth : .infinity , alignment: .leading)
                            .foregroundColor(.white)
                            .shadow(color: Color.black.opacity(1), radius: 12, x: 3, y: 10)
                            .padding()
        
                 
        
        
                    }
        
                }
            
            
            )
        

        .padding()
        .padding(.horizontal)
   
    }
}
