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
                        .multilineTextAlignment(.center)
                }
                .padding(.horizontal)
                Image(taskImage)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(20)
                    .padding(.horizontal)
                Text(taskName)
            }
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
        TaskView(taskName: "Task name", taskImage: "placeholder")
    }
}
