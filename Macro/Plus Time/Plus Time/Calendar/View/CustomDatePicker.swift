//
//  CurrentDatePicker.swift
//  Plus Time
//
//  Created by Jairo Júnior on 21/05/23.
//

import SwiftUI

struct CustomDatePicker: View {
    @Binding var currentDate: Date
    
    @State var currentMonth: Int = 0
    
    @Binding var tasks:[TaskMetaData]
    //@ObservedObject var arrayTasks = arraY()
    
    var body: some View {
        ZStack{
            //viewRoxa().ignoresSafeArea()
            VStack(spacing: 35){
                //dias da semana
                let days: [String] =
                ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat" ]
                
                HStack(spacing: 20){
                    
                    VStack(alignment: .leading, spacing: 10){
                        Text (extraDate() [0]).foregroundColor(roxoEscuro)
                            .font (.caption)
                            .fontWeight (.semibold)
                        
                        Text (extraDate() [1]).foregroundColor(roxoEscuro)
                            .font (.title.bold ())
                         
                    }
                    Spacer (minLength: 0)
                    
                    //botao para retroceder um mes
                    Button {
                        
                        withAnimation{
                            currentMonth -= 1
                        }
                    } label: {
                        Image (systemName: "chevron.left")
                    }
                    //botao para avancar um mes
                    Button {
                        
                        withAnimation{
                            currentMonth += 1
                        }
                    } label: {
                        Image (systemName: "chevron.right")
                    }
                    
                }.padding()
                //foreach para escrever os dias na view
                HStack(spacing: 0){
                    ForEach (days,id: \.self){day in
                        
                        Text (day)
                            .font (.callout)
                            .fontWeight (.semibold)
                            .frame (maxWidth: .infinity)
                            .foregroundColor(roxoLeve)
                            
                    }.foregroundColor(roxoLeve)
                }
                
                let columns = Array (repeating: GridItem(.flexible()), count: 7)
                
                LazyVGrid(columns: columns, spacing: 15){
                    
                    ForEach(extractDate()){value in
                        CardView(value: value)
                            .background(
                                Capsule().foregroundColor(roxoEscuro)
                                    .padding(.horizontal, 4)
                                    .opacity(isSameDay(date1: value.date, date2: currentDate) ? 1 : 0)
                            ).onTapGesture {
                                
                                currentDate = value.date
                            }
                    }
                }
                
                VStack(spacing:20){
                    //título de onde vão as tasks
                    Text("Tasks").frame(maxWidth: .infinity, alignment: .leading).font(.title2.bold()).padding(.vertical, 25).foregroundColor(roxoEscuro)
                    
                    
                    
                    //tasks que vão ser mostradas abaixo do título
                    if let task = tasks.first(where: { task in
                        return isSameDay(date1: task.taskDate, date2: currentDate)
                    })
                    {
                        
                        ForEach(task.task){ task in
                            
                            VStack(alignment: .leading, spacing: 10){
                                //Text(task.time.addingTimeInterval(CGFloat.random(in: 0...5000)), style: .time)
                                Text(task.time.formatted(.dateTime)).foregroundColor(roxoLeve)
                                
                                Text (task.title).font(.title2.bold()).foregroundColor(roxoLeve)
                            }
                            .padding (.vertical, 10)
                            .padding(.horizontal)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(roxo)
                        }
                        
                    }else{
                        //caso não encontre nenhuma task
                        Text("No tasks found").foregroundColor(roxoLeve)
                    }
                    
                }.padding()
                
            }.onChange (of: currentMonth) { newValue in
                currentDate = getCurrentMonth()
            }
        }
    }
    
    @ViewBuilder
    
    func CardView(value: DateValue)->some View{
        //eliminando os valores -1 do calendário
        VStack{
            if value.day != -1{
                
                if let task = tasks.first(where: { task in
                    
                    return isSameDay (date1: task.taskDate, date2: value.date)
                    //parte onde mostra as tasks no calendário//
                }){
                    //se não for valor -1 ele mostra no calendário
                    Text("\(value.day)")
                        .font(.title3.bold())
                        .foregroundColor(roxoLeve)
                    
                        //.foregroundColor (isSameDay (date1: task.taskDate, date2: currentDate) ? roxoLeve: roxoLeve)
                    
                        .frame(maxWidth: .infinity)
                    Spacer ()
                    //aparecer um círculo abaixo do dia em que há uma task
                    Circle().foregroundColor(roxoLeve).frame(width: 8, height: 8)
                    
                }else{
                    //caso não tenha uma task no dia ele não aparece o círculo logo abaixo
                    Text("\(value.day)")
                        .font(.title3.bold())
                    
                        .foregroundColor(roxoLeve)
                        //.foregroundColor (isSameDay (date1: value.date, date2: currentDate) ? roxoLeve: roxoLeve)
                        .frame(maxWidth: .infinity)
                        
                    Spacer()
                     
                }
            }
        }.padding(.vertical, 9).frame(height: 60, alignment: .top)
    }
    //função que ve se é o mesmo dia
    func isSameDay (date1: Date, date2: Date) ->Bool {
        
        let calendar = Calendar.current
        
        return calendar.isDate(date1, inSameDayAs: date2)
    }
    //extrai a data
    func extraDate ()->[String]{
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY MMMM"
        
        let date = formatter.string( from: currentDate)
    
        return date.components (separatedBy: " ")
    }
    
    //pega o mes atual
    func getCurrentMonth ()->Date{
        let calendar = Calendar.current
        guard let currentMonth = calendar.date(byAdding:.month, value: self.currentMonth, to: Date()) else{
            return Date()
        }
        return currentMonth
    }
    //extrai 
    func extractDate ()->[DateValue]{
        let calendar = Calendar.current
        let currentMonth = getCurrentMonth()
        
        var days = currentMonth.getAllDates().compactMap { date -> DateValue in
            let day = calendar.component (.day, from: date)
            
            return DateValue (day: day, date: date)
        }
        
        let firstWeekday = calendar.component (.weekday, from: days.first?.date ?? Date())
        
        for _ in 0..<firstWeekday - 1 {
            days.insert(DateValue (day: -1, date: Date()), at: 0)
        }
        return days
    }
}
/*
struct CurrentDatePicker_Previews: PreviewProvider {
    
    static var previews: some View {
        Home()
    }
}
*/
extension Date{
    func getAllDates ()->[Date]{
        let calendar = Calendar.current
        
        let startDate = calendar.date(from: Calendar.current.dateComponents([.year, .month], from: self))!
        
        let range = calendar.range(of: .day, in: .month, for:
        startDate)!
        
        
        
        return range.compactMap { day -> Date in
            return calendar.date (byAdding: .day, value: day - 1, to: startDate)!
        }
    }
}
