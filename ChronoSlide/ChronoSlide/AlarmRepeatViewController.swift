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
    
    var isNewAlarm: Bool = true
    var alarmToConfig: Alarm = Alarm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Alarm.allRepeats().count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "", for: indexPath) as! EditRepeatTableCellView
        cell.repeatTypeLabel.text = Alarm.allRepeats()[(indexPath as NSIndexPath).row].description
        if alarmToConfig.alarmRepeat.contains(Alarm.allRepeats()[(indexPath as NSIndexPath).row]) {
            cell.isChecked = true
            cell.accessoryType = UITableViewCellAccessoryType.checkmark
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        let selectedCell = tableView.cellForRow(at: indexPath) as! EditRepeatTableCellView
        selectedCell.selectionStyle = UITableViewCellSelectionStyle.none
        if selectedCell.accessoryType == UITableViewCellAccessoryType.none {
            calculateOtherRepeats(selectedCell, row: (indexPath as NSIndexPath).row)
            
        } else {
            selectedCell.accessoryType = UITableViewCellAccessoryType.none
            
        }
        tableView.deselectRow(at: indexPath, animated: true)
        return indexPath
    }
    
    func calculateOtherRepeats(_ tappedOption: EditRepeatTableCellView, row: Int){
        let tapped = Alarm.allRepeats()[row]
        switch (tapped) {
        case .none:
            selectedRepeats = [.none]
            clearTableView()
            tappedOption.accessoryType = UITableViewCellAccessoryType.checkmark
            break
        case .everyday:
            if selectedRepeats.count > 0 {
                clearTableView()
            }
            selectedRepeats = [.everyday]
            tappedOption.accessoryType = UITableViewCellAccessoryType.checkmark
            break
        default:
            if selectedRepeats.contains(repeatType.none) || selectedRepeats.contains(repeatType.everyday) {
                clearTableView()
                selectedRepeats = [tapped]
            } else{
                selectedRepeats.append(tapped)
            }
            tappedOption.accessoryType = UITableViewCellAccessoryType.checkmark
            let noneOption = self.tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as! EditRepeatTableCellView
            noneOption.accessoryType = UITableViewCellAccessoryType.none
        }
    }
    
    func clearTableView(){
        let view = self.tableView
        for anIndex in 0..<Alarm.allRepeats().count  {
            let current =  view?.cellForRow(at: IndexPath(row: anIndex, section: 0)) as! EditRepeatTableCellView
            current.accessoryType = UITableViewCellAccessoryType.none
        }
}
