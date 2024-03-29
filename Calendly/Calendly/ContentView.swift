//
//  ContentView.swift
//  Calendly
//
//  Created by Ghaiath Alhereh on 17.09.23.
//

import SwiftUI

struct ContentView: View {
    
    let days = ["Sun" , "Mon" , "Tue" , "Wed" , "Thu" , "Fri" ,"Sat"]
    @State var selectedMonth = 1
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
                    ForEach(fetchDara()) { value in
                        Text("\(value.day)")
                    }
                }
            }
            
        }
    }
    
    func fetchDara() -> [CalendarDate] {
        let Calendar = Calendar.current
        let cureentMonth = fetchSelectedMonth()
        
        var datesOfMonth = cureentMonth.datesOfMonth().map({CalendarDate(day: Calendar.component(.day, from: $0), date: $0)})
        
        return datesOfMonth
    }
    
    
    func fetchSelectedMonth() -> Date {
        let Calendar = Calendar.current
        let month = Calendar.date(byAdding: .month, value: selectedMonth, to: Date())
        return month!
    }
    
    struct CalendarDate : Identifiable {
        let id = UUID()
        var day: Int
        var date: Date
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


extension Date {
    func datesOfMonth()-> [Date] {
        let calendar = Calendar.current
        let currentMonth = calendar.component(.month, from: self)
        let currentYear = calendar.component(.year, from: self)
        
        var startDateComponents = DateComponents()
        startDateComponents.year = currentYear
        startDateComponents.month = currentMonth
        startDateComponents.day = 1
        let startDate = calendar.date(from: startDateComponents)!
        
        var endDateComponents = DateComponents()
        endDateComponents.month = 1
        endDateComponents.day = -1
        let endDate = calendar.date (byAdding: endDateComponents, to: startDate)!
        
        var dates: [Date] = []
        var currentDate = startDate
        
        while currentDate <= endDate {
            dates.append (currentDate)
            currentDate = calendar.date (byAdding: .day, value: 1, to: currentDate)!
        }
        return dates
    }
}
