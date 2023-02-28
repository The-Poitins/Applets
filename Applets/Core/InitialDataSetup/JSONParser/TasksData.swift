//
//  TasksDataModel.swift
//  Applets
//
//  Created by Aleksandra Nikiforova on 21/02/23.
//

import Foundation

struct TasksData: Codable {
    let title: String
    let information: String
    let timeFrame: String
    let imageName: String
    let isEnabled: Bool
    let steps: [StepData]
}

struct StepData: Codable {
    let title: String
    let number: Int
    let text: String
    let isDone: Bool
    let weight: Double
    let location: Location
}

struct Location: Codable {
    let longitude: Double
    let latitude: Double
}
