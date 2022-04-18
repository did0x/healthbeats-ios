//
//  TaskFeeder.swift
//  healthbeats
//
//  Created by Ridho Saputra on 16/04/22.
//

import Foundation
import UIKit

struct TaskFeeder {
    var arrOfTask: [Task] = []
    
    init() {
        let task0 = Task(name: "Diabetes Plan A", title: "Blood Glucose", description: "Ensure your iHealth Smart (BG5S) is powered and connected to your mobile device", image: UIImage(named: "ihealth-glucometer"), action: "Measure", rule: "Before Breakfast", amount: 1)
        let task1 = Task(name: "Heart Plan A", title: "Blood Pressure", description: "Ensure your iHealth Neo (BP5S) is powered and connected to your mobile device", image: UIImage(named: "ihealth-blood-pressure"), action: "Measure", rule: "10.00 - 13.00", amount: 1)
        let task2 = Task(name: "BYOD PO Programee A", title: "Oxygen Saturation and Heart Rate", description: "Please use your own device to take the measurement and tap `Add Result` button below to input your result", image: UIImage(named: "ihealth-pulse"), action: "Add Result", rule: "5 times a day", amount: 5)
        let task3 = Task(name: "Weight Programee A", title: "Weight and BMI", description: "Please use your own device to take the measurement and tap `Add Result` button below to input your result", image: UIImage(named: "ihealth-body-scale"), action: "Add Result", rule: "3 times a day", amount: 3)
        let task4 = Task(name: "Diabetes Plan B", title: "Blood Glucose", description: "Ensure your iHealth Lancing Pen is powered and connected to your mobile device", image: UIImage(named: "ihealth-lancing-pen"), action: "Measure", rule: "Before Breakfast", amount: 1)
        let task5 = Task(name: "BYOD PO Programee B", title: "Swim and Sleep Tracker", description: "Please use your own device to take the measurement and tap `Add Result` button below to input your result", image: UIImage(named: "ihealth-wave"), action: "Add Result", rule: "2 times a day", amount: 2)
        let task6 = Task(name: "Fever Plan A", title: "Body Temperature", description: "Please use your own device to take the measurement and tap `Add Result` button below to input your result", image: UIImage(named: "ihealth-thermometer"), action: "Add Result", rule: "3 times a day", amount: 3)
        let task7 = Task(name: "Heart Plan B", title: "Blood Pressure", description: "Ensure your change your cuff for iHealth Track/Ease weekly", image: UIImage(named: "ihealth-track-ease"), action: "Change", rule: "1 times a day", amount: 1)
        
        arrOfTask.append(task0)
        arrOfTask.append(task1)
        arrOfTask.append(task2)
        arrOfTask.append(task3)
        arrOfTask.append(task4)
        arrOfTask.append(task5)
        arrOfTask.append(task6)
        arrOfTask.append(task7)
    }
}
