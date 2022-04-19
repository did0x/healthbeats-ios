//
//  Task.swift
//  healthbeats
//
//  Created by Ridho Saputra on 15/04/22.
//

import Foundation
import UIKit

struct Task {
    let name: String
    let title: String
    let description: String
    let image: UIImage?
    let action: String
    let rule: String
    let currentAmount: Int = 0
    let amount: Int
}
