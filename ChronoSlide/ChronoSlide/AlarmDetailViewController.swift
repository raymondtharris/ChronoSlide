//
//  AlarmDetailViewController.swift
//  ChronoSlide
//
//  Created by Tim Harris on 6/23/16.
//  Copyright © 2016 Tim Harris. All rights reserved.
//

import Foundation
import UIKit



class AlarmDetailViewController: UIViewController {
    //Outlets
    @IBOutlet weak var alarmTimeTextField: UITextField!
    
    @IBOutlet weak var alarmSongAlbumImageView: UIImageView!
    @IBOutlet weak var alarmSongButton: UIButton!
    
    @IBOutlet weak var alarmRepeatButton: UIButton!
    
    @IBOutlet weak var alarmNameTextField: UITextField!
    
    @IBOutlet weak var alarmDeleteButton: UIButton!
    
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

extension AlarmDetailViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return hourData.count
        } else if component == 1 {
            return minuteData.count
        } else {
            return ampmData.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 {
            
        } else if component == 1 {
            
        } else {
            
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return hourData[row]
        } else if component == 1 {
            return minuteData[row]
        } else {
            return ampmData[row]
        }
    }
}


extension AlarmDetailViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
}

