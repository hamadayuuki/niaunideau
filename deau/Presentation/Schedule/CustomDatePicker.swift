//
//  CustomDatePicker.swift
//  deau
//
//  Created by yuki.hamada on 2024/11/27.
//

import SwiftUI

enum Day {
    case sun
    case mon
    case tue
    case wed
    case thu
    case fri
    case sat

    var name: String {
        switch self {
        case .sun: return "Sun"
        case .mon: return "Mon"
        case .tue: return "Tue"
        case .wed: return "Wed"
        case .thu: return "Thu"
        case .fri: return "Fri"
        case .sat: return "Sat"
        }
    }
}

struct CustomDatePicker: View {
    @Binding var currentDate: Date

    // Month update on arrow button clicks...
    @State var currentMonth: Int = 0

    var body: some View {

        VStack(spacing: 35){

            let days: [Day] = [.sun, .mon, .tue, .wed, .thu, .fri, .sat]

            HStack(spacing: 20){
                VStack(alignment: .leading, spacing: 10) {
                    Text(extraDate()[0])
                        .font(.caption)
                        .fontWeight(.semibold)

                    Text(extraDate()[1])
                        .font(.title.bold())
                }

                Spacer(minLength: 0)

                Button {
                    withAnimation{
                        currentMonth -= 1
                    }
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                }

                Button {

                    withAnimation{
                        currentMonth += 1
                    }

                } label: {
                    Image(systemName: "chevron.right")
                        .font(.title2)
                }
            }
            .padding(.horizontal)
            // Day View...

            HStack(spacing: 0){
                ForEach(days, id: \.self){ day in
                    switch day {
                    case .sun:
                        Text(day.name)
                            .font(.callout)
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity)
                            .foregroundStyle(.red)
                    case .sat:
                        Text(day.name)
                            .font(.callout)
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity)
                            .foregroundStyle(.blue)
                    case .mon, .tue, .wed, .thu, .fri:
                        Text(day.name)
                            .font(.callout)
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity)
                    }
                }
            }

            let columns = Array(repeating: GridItem(.flexible()), count: 7)

            LazyVGrid(columns: columns,spacing: 15) {
                ForEach(extractDate()){value in
                    CardView(value: value)
                        .background(
                            Capsule()
                                .fill(.pink)
                                .padding(.horizontal, 2)
                                .opacity(isSameDay(date1: value.date, date2: currentDate) ? 1 : 0)
                        )
                        .onTapGesture {
                            currentDate = value.date
                        }
                }
            }

            VStack(spacing: 15) {
                Text("Tasks")
                    .font(.title2.bold())
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .padding(.vertical,20)

                if let task = tasks.first(where: { task in
                    return isSameDay(date1: task.taskDate, date2: currentDate)
                }){
                    VStack(spacing: 24) {
                        ForEach(task.task) { task in
                            schedule(task: task, color: .pink)
                        }
                    }
                }
                else {
                    Text("No Task Found")
                }
            }
            .padding()
        }
        .onChange(of: currentMonth) { newValue in
            currentDate = getCurrentMonth()
        }
    }

    @ViewBuilder
    private func schedule(task: Task, color: Color) -> some View {
        HStack(spacing: 12) {
            Circle()
                .frame(width: 15, height: 15)
                .foregroundStyle(color)

            VStack(alignment: .leading, spacing: 4) {
                Text(task.time)
                    .font(.system(size: 14, weight: .regular, design: .rounded))
                    .foregroundStyle(.gray)

                Text(task.title)
                    .frame(width: 230, height: 60, alignment: .leading)
                    .padding(.horizontal, 24)
                    .background(color.opacity(0.5))
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.gray, lineWidth: 0.3)
                    )
            }
        }
    }

    @ViewBuilder
    func CardView(value: DateValue)->some View{
        VStack{

            if value.day != -1{

                if let task = tasks.first(where: { task in

                    return isSameDay(date1: task.taskDate, date2: value.date)
                }){
                    Text("\(value.day)")
                        .font(.title3.bold())
                        .foregroundColor(isSameDay(date1: task.taskDate, date2: currentDate) ? .white : .primary)
                        .frame(maxWidth: .infinity)

                    Spacer()

                    Circle()
                        .fill(isSameDay(date1: task.taskDate, date2: currentDate) ? .white : .pink)
                        .frame(width: 8,height: 8)
                }
                else{

                    Text("\(value.day)")
                        .font(.title3.bold())
                        .foregroundColor(isSameDay(date1: value.date, date2: currentDate) ? .white : .primary)
                        .frame(maxWidth: .infinity)

                    Spacer()
                }
            }
        }
        .padding(.vertical,9)
        .frame(height: 60,alignment: .top)
    }

    func isSameDay(date1: Date,date2: Date)->Bool{
        let calendar = Calendar.current

        return calendar.isDate(date1, inSameDayAs: date2)
    }

    func extraDate()->[String]{

        let calendar = Calendar.current
        let month = calendar.component(.month, from: currentDate) - 1
        let year = calendar.component(.year, from: currentDate)

        return ["\(year)",calendar.monthSymbols[month]]
    }

    func getCurrentMonth()->Date{

        let calendar = Calendar.current

        // Getting Current Month Date....
        guard let currentMonth = calendar.date(byAdding: .month, value: self.currentMonth, to: Date()) else{
            return Date()
        }

        return currentMonth
    }

    func extractDate()->[DateValue]{

        let calendar = Calendar.current

        let currentMonth = getCurrentMonth()

        var days = currentMonth.getAllDates().compactMap { date -> DateValue in

            let day = calendar.component(.day, from: date)

            return DateValue(day: day, date: date)
        }

        let firstWeekday = calendar.component(.weekday, from: days.first!.date)

        for _ in 0..<firstWeekday - 1{
            days.insert(DateValue(day: -1, date: Date()), at: 0)
        }

        return days
    }
}

struct CustomDatePicker_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension Date{

    func getAllDates()->[Date]{

        let calendar = Calendar.current

        let startDate = calendar.date(from: Calendar.current.dateComponents([.year,.month], from: self))!

        let range = calendar.range(of: .day, in: .month, for: startDate)!

        return range.compactMap { day -> Date in
            return calendar.date(byAdding: .day, value: day - 1, to: startDate)!
        }
    }
}
