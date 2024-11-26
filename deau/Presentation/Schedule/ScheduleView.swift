//
//  ScheduleView.swift
//  deau
//
//  Created by yuki.hamada on 2024/11/26.
//

import SwiftUI

struct ScheduleView: View {
    @State private var vm: ScheduleViewModel = .init()

    var body: some View {
        VStack {
            NavigationStack {
                CalendarView()
            }
        }
    }
}

#Preview {
    ScheduleView()
}
