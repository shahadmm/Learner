//
//  OnboardingViewModel.swift
//  MyApp
//
//  Created by shahad almaghrabi on 30/05/1448 AH.
//

import Foundation
import Observation

@Observable
class OnboardingViewModel {
    var selectedPeriod: LearningPeriod = .week
    var learningTopic: String = ""
    
    func select(_ period: LearningPeriod){
        selectedPeriod = period
    }
        var canStartLearning : Bool{
            !learningTopic.isEmpty
           
        }
        func startLearning(){
            print ("Start Learning tapped")
            
            
            
        }
    }

