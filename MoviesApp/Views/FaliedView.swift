//
//  FaliedView.swift
//  MoviesApp
//
//  Created by Reenad gh on 17/04/1444 AH.
//

import SwiftUI

struct FaliedView: View {
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                Text("?")
                    .font(.system(size: 100))
                    .opacity(0.3)
                .foregroundColor(.white)
                
                Text("Sorry, no result are found !")
                    .foregroundColor(.white.opacity(0.4))
                    .font(.system(size: 18))
                Spacer()

            }
            
        }
        
    }
}

struct FaliedView_Previews: PreviewProvider {
    static var previews: some View {
        FaliedView()
            .background(Color.darkBackground)
    }
}
