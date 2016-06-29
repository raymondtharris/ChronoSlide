//
//  AlarmDetailViewController.swift
//  ChronoSlide
//
//  Created by Tim Harris on 6/23/16.
//  Copyright © 2016 Tim Harris. All rights reserved.
//

import Foundation
import UIKit



class AlarmDetailViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {
    var isNewAlarm: Bool = true
    var alarmToConfig: Alarm = Alarm()
    var hourData: [String] = []
    var minuteData: [String] = []
    var ampmData: [String] = ["AM", "PM"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createPickerViewArrays()
        
        
    }

    private func createPickerViewArrays() {
        for aNumber in 0..<60 {
            if aNumber < 10 {
                minuteData.append("0" + aNumber.description)
            } else {
                minuteData.append(aNumber.description)
            }
        }
        for aNumber2 in 1..<13 {
            hourData.append(aNumber2.description)
        }
    }
}


