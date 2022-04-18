//
//  PlanFeeder.swift
//  healthbeats
//
//  Created by Ridho Saputra on 16/04/22.
//

import Foundation
import UIKit

struct PlanFeeder {
    var arrOfPlan: [Plan] = []
    
    init() {
        let plan0 = Plan(name: "Diabetes Plan A", image: UIImage(named: "plan-1"), location: "Hospital 1", type: "type-hospital")
        
        let plan1 = Plan(name: "Heart Plan A", image: UIImage(named: "plan-2"), location: "Hospital 1", type: "type-hospital")
        
        let plan2 = Plan(name: "BYOD PO Programee A", image: UIImage(named: "plan-3"), location: "Clinic 1", type: "type-clinic")
        let plan3 = Plan(name: "BYOD PO Programee A", image: UIImage(named: "plan-4"), location: "Clinic 2", type: "type-clinic")
        let plan4 = Plan(name: "Weight Programee A", image: UIImage(named: "plan-5"), location: "Clinic 2", type: "type-clinic")
        let plan5 = Plan(name: "Diabetes Plan B", image: UIImage(named: "plan-6"), location: "Hospital 2", type: "type-hospital")
        let plan6 = Plan(name: "BYOD PO Programee B", image: UIImage(named: "plan-7"), location: "Clinic 2", type: "type-clinic")
        let plan7 = Plan(name: "Fever Plan A", image: UIImage(named: "plan-8"), location: "Clinic 1", type: "type-clinic")
        let plan8 = Plan(name: "Heart Plan B", image: UIImage(named: "plan-9"), location: "Hospital 1", type: "type-hospital")
        let plan9 = Plan(name: "Heart Plan B", image: UIImage(named: "plan-10"), location: "Hospital 2", type: "type-hospital")
        
        arrOfPlan.append(plan0)
        arrOfPlan.append(plan1)
        arrOfPlan.append(plan2)
        arrOfPlan.append(plan3)
        arrOfPlan.append(plan4)
        arrOfPlan.append(plan5)
        arrOfPlan.append(plan6)
        arrOfPlan.append(plan7)
        arrOfPlan.append(plan8)
        arrOfPlan.append(plan9)
    }
}
