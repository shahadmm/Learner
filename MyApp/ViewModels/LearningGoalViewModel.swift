//
//  LearningGoalViewModel.swift
//  MyApp
//
//  Created by shahad almaghrabi on 05/06/1448 AH.
//

import Foundation
import Observation

@Observable
class LearningGoalViewModel {
    var learningTopic: String = ""
    var selectedPeriod: LearningPeriod = .week
    var isShowingUpdateAlert: Bool = false
    
    func showUpdateAlert() {
        isShowingUpdateAlert = true
        
    }
    func updateGoal() {
        
        
    }
}
