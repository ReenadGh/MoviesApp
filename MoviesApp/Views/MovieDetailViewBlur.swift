//
//  MovieDetailViewBlur.swift
//  MoviesApp
//
//  Created by Reenad gh on 16/04/1444 AH.
//

import SwiftUI
import SDWebImageSwiftUI

struct MovieDetailViewBlur: View {
    var namespace : Namespace.ID
    @Binding var movie : MovieViewModel
    @Binding var showMovieView : Bool
    var body: some View {
        
      


                     
                            
                        
                            
                            
                            VStack (alignment:.leading) {
                                ScrollView{
                                    WebImage(url: URL(string: movie.poster))
                                        .resizable()
                                        .scaledToFit()
                                        .frame(  height: 300)
                                        .frame(  maxWidth: 200)

                                        .cornerRadius(20)
                                        .shadow(color: Color.darkBackground, radius: 20, x: 5, y: 5)
                                        .matchedGeometryEffect(id: movie.getId(type: .poster), in: namespace)

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

                                }
                            .foregroundColor(.white)
                            .padding()
                                .padding(.top , 100)
                                .frame(maxWidth : .infinity)
                   

                      
                            }
                            
                        
            
                           .frame(maxWidth : .infinity)
                    

                  


                
            

        
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
        .background(
            
            ZStack {
                WebImage(url: URL(string: movie.poster))
                .resizable()
                Blur(style: .dark)

            }
                .ignoresSafeArea()

        )

        

    }
}

//struct MovieDetailViewBlur_Previews: PreviewProvider {
//    @Namespace  static var namespace
//
//    static var previews: some View {
//        
//        
//        MovieDetailViewBlur(namespace: namespace, movie: .constant(MovieViewModel()), showMovieView: .constant(true))
//    }
//}
