//
//  TaskView.swift
//  Applets
//
//  Created by Viacheslav on 17/02/23.
//

import SwiftUI

struct TaskView: View {
    var taskName: String
    var body: some View {
        Text(taskName)
    }
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView(taskName: "Task name")
    }
}
