//
//  ContentView.swift
//  Calendly
//
//  Created by Ghaiath Alhereh on 17.09.23.
//

import SwiftUI

struct ContentView: View {
    
    let days = ["Sun" , "Mon" , "Tue" , "Wed" , "Thu" , "Fri" ,"Sat"]
    @State var selectedMonth = 0
    var body: some View {
        VStack {
            Image("rami")
                .resizable()
                .scaledToFit()
                .frame(width: 128 , height: 128)
                .cornerRadius(64)
            
            Text("Rami! Mustafa")
                .font(.title)
                .bold()
            
            
            Rectangle()
                .frame(height: 1)
                .foregroundColor(.gray)
            
            
            VStack (spacing: 20 ) {
                
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
                
                HStack {
                    ForEach(days , id:\.self) { day in
                        Text(day)
                            .font(.system(size: 12 , weight: .medium))
                            .frame(maxWidth: .infinity)
                    }
                }
                
                LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 7)) {
                    
                }
            }
            
        }
    }
    
    func fetchDara() -> [CalendarData] {
        let Calendar = Calendar.current
        let cureentMonth = fetchSelectedMonth()
        
    }
    
    
    func fetchSelectedMonth() -> Date {
        let Calendar = Calendar.current
        let month = Calendar.date(byAdding: .month, value: selectedMonth, to: Date())
        return month!
    }
    
    struct CalendarData : Identifiable {
        let id = UUID()
        var day: Int
        var data: Date
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


extension Date {
    
    func datesOfMonth() -> [Date] {
        let calendar = Calendar.current
        let currentMonth = calendar.component(.month, from: self)
        let currentYear = calendar.component(.year, from: self)
        
        
        
        var dates: [Date] = []
        
        return dates
    }
    	
}
