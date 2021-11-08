//
//  SleepIntervel.swift
//  WorkingOnMyAPI
//
//  Created by Aon 9/18/19.
//  Copyright © 2019 elbohy. All rights reserved.
//

import Foundation

class SleepIntervel {
    private var sleepAmountInterval = 2
    
    
    func calculateSleep(requestAGain:@escaping ()->Void)->String{
        print("will try after \(sleepAmountInterval) Secounds")
        let newValue = Int( Double(sleepAmountInterval) * 1.5)
        sleepAmountInterval = newValue
//        sleep(sleepAmountInterval)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(sleepAmountInterval)) {
            requestAGain()
        }
        
        return "will try after \(sleepAmountInterval)"
    }
    
    func resetSleepIntervals(){
        self.sleepAmountInterval = 2
    }
    
}
