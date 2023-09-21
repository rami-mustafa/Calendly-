//
//  ContentView.swift
//  Calendly
//
//  Created by Ghaiath Alhereh on 17.09.23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image("rami")
                .resizable()
                .scaledToFit()
                .frame(width: 128 , height: 128)
                .cornerRadius(64)
            
            Text("Rami!")
                .font(.title)
                .bold()
            
            
            Rectangle()
                .frame(height: 1)
                .foregroundColor(.gray)
            
            
            VStack{
                
                Text("Rami!")
                    .font(.title2)
                    .bold()
                
                HStack{
                    Spacer()

                    Image(systemName: "lessthan")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 16 , height: 28)
                    Spacer()
                    
                    Text(" Eylül 25")
                    
                    Spacer()
                    
                    Image(systemName: "greaterthan")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 16 , height: 28)
                    
                    Spacer()

                }
            }
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
