//
//  Task.swift
//  deau
//
//  Created by yuki.hamada on 2024/11/27.
//

import SwiftUI


struct Task: Identifiable{
    var id = UUID().uuidString
    var title: String
    var time: String
}

struct TaskMetaData: Identifiable{
    var id = UUID().uuidString
    var task: [Task]
    var taskDate: Date
}

func getSampleDate(offset: Int) -> Date{
    let calender = Calendar.current
    let date = calender.date(byAdding: .day, value: offset, to: Date())
    return date ?? Date()
}

var tasks: [TaskMetaData] = [

    TaskMetaData(
        task: [
            Task(title: "彼女とのデート", time: "13:00"),
            Task(title: "港区でディナー", time: "19:00"),
        ],
        taskDate: getSampleDate(offset: 1)
    ),
    TaskMetaData(
        task: [
            Task(title: "筋トレ", time: "20:00"),
        ],
        taskDate: getSampleDate(offset: -3)
    ),
    TaskMetaData(
        task: [
            Task(title: "RADWIMPSのライブ", time: "16:00"),
        ],
         taskDate: getSampleDate(offset: -8)
    ),
    TaskMetaData(
        task: [
            Task(title: "同期と爆飲み会", time: "18:30"),
        ],
        taskDate: getSampleDate(offset: 10)
    ),
    TaskMetaData(
        task: [
            Task(title: "鹿児島へ帰省", time: "9:00"),
        ],
        taskDate: getSampleDate(offset: -22)
    ),
    TaskMetaData(
        task: [
            Task(title: "犬の散歩", time: "10:00"),
        ],
        taskDate: getSampleDate(offset: 15)
    ),
    TaskMetaData(
        task: [
            Task(title: "職場の女の子とランチ会", time: "12:00"),
        ],
        taskDate: getSampleDate(offset: -20)
    )
]
