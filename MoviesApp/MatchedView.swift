//
//  MatchedView.swift
//  MoviesApp
//
//  Created by Reenad gh on 14/04/1444 AH.
//

import SwiftUI

struct MatchedView: View {
    @Namespace var namespace
    @State var show : Bool = true
    
    var body: some View {
        ZStack{
        if show {
                 
                
    
           
   
        }else {
            
            
            
          
            
                

        }
        }
        .onTapGesture {
            withAnimation (.spring(response: 0.7, dampingFraction: 1)){
            show.toggle()
            }
        }
    }
}

struct MatchedView_Previews: PreviewProvider {
    static var previews: some View {
        MatchedView()
    }
}
