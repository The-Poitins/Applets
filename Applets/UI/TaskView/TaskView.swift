//
//  TaskView.swift
//  Applets
//
//  Created by Viacheslav on 17/02/23.
//

import SwiftUI

struct TaskView: View {
    let taskName: String
    let taskImage: String
    let steps: [String]
    var body: some View {
            ScrollView {
                ZStack(alignment: .leading) {
                    Rectangle()
                        .frame(width: 370, height: 25)
                        .foregroundColor(.gray.opacity(0.30))
                        .cornerRadius(20)
                    Rectangle()
                        .frame(width: 70, height: 25)
                        .foregroundColor(.accentColor)
                        .cornerRadius(20)
                    Text("15% has done")
                        .frame(maxWidth: .infinity)
                }
                Image(taskImage)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(20)
                Text("Description")
                    .font(.title)
                    .padding(.top, 2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("There is some text about the TASK. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean maximus nisi quis sem pharetra, sit amet vulputate nisi efficitur.")
                Text("Steps")
                    .font(.title)
                    .padding(.top, 2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                ForEach(steps, id: \.self) { step in
                    Text(step)
                }
            }
            .padding(.horizontal)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                Image("bg")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
            )
    }
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView(taskName: "Task name", taskImage: "placeholder", steps: ["Step1", "Step 2"])
    }
}
