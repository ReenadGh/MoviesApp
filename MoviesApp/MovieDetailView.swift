//
//  MovieDetailView.swift
//  MoviesApp
//
//  Created by Reenad gh on 15/04/1444 AH.
//

import SwiftUI

struct MovieDetailView: View {
    var namespace : Namespace.ID
    @Binding var movie : Movie
    @Binding var showMovieView : Bool
    var body: some View {
        
        ZStack {
            VStack (alignment: .leading, spacing: 0){
               
           
                        Image(movie.poster)
                            .resizable()
                             .scaledToFill()
                             .frame(maxHeight : 600)
                             .matchedGeometryEffect(id: movie.getId(type: .poster), in: namespace)
                Spacer()
     
                
        }
            
          


                        VStack ( spacing: 12){
                            RoundedRectangle(cornerRadius: 1)
                                .frame( height: 300)
                                .foregroundColor(Color.clear)
                            
                            
                            VStack (alignment:.leading) {
                                ScrollView{
                                    Text(movie.title)
                                    .font(.largeTitle.bold())
                                .matchedGeometryEffect(id: movie.getId(type: .title), in: namespace)
                                    Text("star War movie star War movie star War movie star War movie star War movie star War movie star War movie star War movie")
                                        .font(.system(size: 17).bold())
                                        .matchedGeometryEffect(id: movie.getId(type: .desc), in: namespace)


                                    
                                    HStack{
                                        
                                        ForEach(0 ..< 5) { item in
                                            Image(systemName: "star.fill")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 40, height: 40)
                                                .foregroundColor(.yellow)
                                                .shadow(color: Color.black.opacity(1), radius: 12, x: 3, y: 10)
                                          


                                        }
                                        
                                    }
                                    .matchedGeometryEffect(id: movie.getId(type: .stars), in: namespace)
                                    Spacer()
                                }
                            .foregroundColor(.white)
                            .padding()
                                .padding(.top , 100)
                                .frame(maxWidth : .infinity)
                   

                      
                            }
                            
                        }
                        .background(
                                                    
                            
                            LinearGradient(gradient: Gradient(stops: [
                                .init(color: Color.darkBackground , location: 0.5)
                                     ,
                                .init(color: Color.clear , location: 0.8
                                     )
                            
                            ]), startPoint: .bottom, endPoint: .top)
                      

                            
                    )
                           .frame(maxWidth : .infinity)
                    

                  


                
            

        }
        .overlay(
            Button {
                withAnimation (.spring(response: 0.7, dampingFraction: 1)){
                    showMovieView.toggle()
                }
            }label: {
                Image(systemName: "xmark")
                    .foregroundColor(.white)
                    .padding()
                    .background(
                    Circle()
                        .foregroundColor(
                            Color.darkBackground.opacity(0.7)
                                
                        )
                        .shadow(color: Color.darkBackground.opacity(1), radius: 10, x: 5, y: 10)
                    )
            }
                .padding()
            ,alignment: .topTrailing
    )
        .background(Color.darkBackground)

        
        .ignoresSafeArea()

    }
}

struct MovieDetailView_Previews: PreviewProvider {
    @Namespace  static var namespace

    static var previews: some View {
        
        
        MovieDetailView(namespace: namespace, movie: .constant(.init(title: "Movie1", year: "2020", imdbId: "ee", poster: "movie1")), showMovieView: .constant(true))
    }
}
