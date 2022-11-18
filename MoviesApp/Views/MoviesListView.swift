//
//  MoviesListView.swift
//  MoviesApp
//
//  Created by Reenad gh on 15/04/1444 AH.
//

import SwiftUI
import SDWebImage
import SDWebImageSwiftUI
struct MoviesListView: View {
   
    @ObservedObject private var moviesVM : MoviesListViewModel
    
    @Namespace var namespace
    @State var showMovieView : Bool = false
    @State var searchtext : String = ""
    @State var currentMovie : MovieViewModel = .init(movie: Movie.init(title: "", year: "", imdbId: "", poster: ""))
    
    init () {
        self.moviesVM  =  MoviesListViewModel()
    }
    var body: some View {
        
        if (!showMovieView){
        VStack {
            
            TitleView()
            
            
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.white)
                TextField(" Search", text: $searchtext ,onEditingChanged: { _ in} , onCommit: {
                    self.moviesVM.getMovieBySearch(search: searchtext)
                }
                )
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
            
            

        .padding(.horizontal , 30)

            if (moviesVM.loadingState == .success) {
                ScrollView {

                ForEach(moviesVM.movies , id : \.self ) { movie in
                    MovieCardView(namespace: namespace, movie: movie)
                        .onTapGesture {
                            currentMovie = movie
                            withAnimation (.spring(response: 0.7, dampingFraction: 1)){
                            showMovieView.toggle()
                            }
                        }
                }
                }
            
            }else if (moviesVM.loadingState == .falied){
                FaliedView()
            }else if moviesVM.loadingState == .loading {
                CustomProgressView()

                
            }
            Spacer()
            
            }
        
        .background(
            
            
            DarkBackground()
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
    var movie : MovieViewModel
    var body: some View {
        
        RoundedRectangle (cornerRadius: 20)
            .frame( height: 150 )
            .foregroundColor(Color.clear)

            .cornerRadius(12)
        
            .overlay(
            
                
                VStack (spacing : 0 ) {
        
        
        
        
                    HStack {
                        WebImage(url: URL (string: movie.poster))
                            .resizable()
                            .scaledToFill()
                            .frame( width : 100 , height: 140)
                            .cornerRadius(15)
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

struct TitleView: View {
    var body: some View {
        Text("Movies")
            .font(.largeTitle.bold())
            .foregroundColor(.white)
            .multilineTextAlignment(.leading)
            .frame(maxWidth : .infinity , alignment: .leading)
            .padding()
            .padding(.top)
            .padding(.leading)
    }
}

struct DarkBackground: View {
    var body: some View {
        ZStack {
            Color.darkBackground
            LinearGradient(colors: [.blue.opacity(0.2)  ,.pink.opacity(0.1), .purple.opacity(0.4)], startPoint: .topTrailing, endPoint: .bottomLeading)
            Blur(style: .dark)
            
        }
        .ignoresSafeArea()
    }
}

struct CustomProgressView: View {
    var body: some View {
        VStack {
            Spacer()
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: Color.white))
                .padding(30)
                .background(Color.darkBackground)
                .cornerRadius(12)
            Spacer()
            
        }
    }
}
