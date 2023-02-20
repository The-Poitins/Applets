//
//  TaskView.swift
//  Applets
//
//  Created by Viacheslav on 17/02/23.
//

import SwiftUI

struct TaskView: View {

    var task: Task

    var body: some View {
        ScrollView {
            Text(task.title ?? "")
            ForEach(Array(task.allSteps)) { step in
                Text(step.title ?? "")
            }
        }
    }
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        let task = Task.previewExample(for: 0, in: PersistenceController.preview.context)
        TaskView(task: task)
    }
}
