//
//  DateValue.swift
//  deau
//
//  Created by yuki.hamada on 2024/11/27.
//

import SwiftUI

// Date Value Model...
struct DateValue: Identifiable{
    var id = UUID().uuidString
    var day: Int
    var date: Date
}
