//
//  ScheduleView.swift
//  deau
//
//  Created by yuki.hamada on 2024/11/26.
//

import SwiftUI

struct ScheduleView: View {
    @State private var vm: ScheduleViewModel = .init()

    @State var currentDate: Date = Date()

    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 20){
                    CustomDatePicker(currentDate: $currentDate)
                }
                .padding(24)
            }
            .safeAreaInset(edge: .bottom) {

                HStack{
                    Button {
                        // Add Task
                    } label: {
                        Text("Add Task")
                            .fontWeight(.bold)
                            .padding(.vertical)
                            .frame(maxWidth: .infinity)
                            .background(.orange, in: Capsule())
                    }

                    Button {
                        // Add Remainder
                    } label: {
                        Text("Add Remainder")
                            .fontWeight(.bold)
                            .padding(.vertical)
                            .frame(maxWidth: .infinity)
                            .background(.purple, in: Capsule())
                    }
                }
                .padding(.horizontal)
                .padding(.top,10)
                .foregroundColor(.white)
                .background(.ultraThinMaterial)
            }
        }
    }
}

#Preview {
    ScheduleView()
}
