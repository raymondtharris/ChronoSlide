//
//  AlarmRepeatViewController.swift
//  ChronoSlide
//
//  Created by Tim Harris on 7/1/16.
//  Copyright © 2016 Tim Harris. All rights reserved.
//

import Foundation
import UIKit


class AlarmRepeatViewController: UITableViewController {
    
    
    @IBOutlet weak var doneButton: UIBarButtonItem!
    
    var isNewAlarm: Bool = true
    var alarmToConfig: Alarm = Alarm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Alarm.allRepeats().count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AlarmRepeatCellView", for: indexPath) as! AlarmRepeatTableCellView
        cell.repeatTypeLabel.text = Alarm.allRepeats()[(indexPath as NSIndexPath).row].description
        if alarmToConfig.alarmRepeat.contains(Alarm.allRepeats()[(indexPath as NSIndexPath).row]) {
            cell.isChecked = true
            cell.accessoryType = UITableViewCellAccessoryType.checkmark
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        let selectedCell = tableView.cellForRow(at: indexPath) as! AlarmRepeatTableCellView
        selectedCell.selectionStyle = UITableViewCellSelectionStyle.none
        if selectedCell.accessoryType == UITableViewCellAccessoryType.none {
            calculateOtherRepeats(selectedCell, row: (indexPath as NSIndexPath).row)
            
        } else {
            selectedCell.accessoryType = UITableViewCellAccessoryType.none
            
        }
        tableView.deselectRow(at: indexPath, animated: true)
        return indexPath
    }
    
    
    @IBAction func saveAlarmRepeats(segue:UIStoryboardSegue) {
        let destViewControlller = segue.destinationViewController as! AlarmDetailViewController
        destViewControlller.alarmToConfig.alarmRepeat = alarmToConfig.alarmRepeat
        
    }
    
    func calculateOtherRepeats(_ tappedOption: AlarmRepeatTableCellView, row: Int){
        let tapped = Alarm.allRepeats()[row]
        switch (tapped) {
        case .none:
            alarmToConfig.alarmRepeat = [.none]
            clearTableView()
            tappedOption.accessoryType = UITableViewCellAccessoryType.checkmark
            break
        case .everyday:
            if alarmToConfig.alarmRepeat.count > 0 {
                clearTableView()
            }
            alarmToConfig.alarmRepeat = [.everyday]
            tappedOption.accessoryType = UITableViewCellAccessoryType.checkmark
            break
        default:
            if alarmToConfig.alarmRepeat.contains(repeatType.none) || alarmToConfig.alarmRepeat.contains(repeatType.everyday) {
                clearTableView()
                alarmToConfig.alarmRepeat = [tapped]
            } else{
                alarmToConfig.alarmRepeat.append(tapped)
            }
            tappedOption.accessoryType = UITableViewCellAccessoryType.checkmark
            let noneOption = self.tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as! AlarmRepeatTableCellView
            noneOption.accessoryType = UITableViewCellAccessoryType.none
        }
    }
    
    func clearTableView(){
        let view = self.tableView
        for anIndex in 0..<Alarm.allRepeats().count  {
            let current =  view?.cellForRow(at: IndexPath(row: anIndex, section: 0)) as! AlarmRepeatTableCellView
            current.accessoryType = UITableViewCellAccessoryType.none
        }
    }
}

class AlarmRepeatTableCellView: UITableViewCell {
    @IBOutlet weak var repeatTypeLabel: UILabel!
    var isChecked: Bool = false
    
    
}

