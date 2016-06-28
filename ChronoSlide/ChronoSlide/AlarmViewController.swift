//
//  AlarmViewController.swift
//  ChronoSlide
//
//  Created by Tim Harris on 6/25/16.
//  Copyright © 2016 Tim Harris. All rights reserved.
//

import Foundation
import UIKit

let AddingNewAlarmNotification:String = "AddingNewAlarmNotification"
let DeletingAlarmNotification:String = "DeletingAlarmNotification"
let UpdatingAlarmNotification:String = "UpdatingAlarmNotification"

class AlarmViewController: UITableViewController {
    
    var Alarms = [Alarm]()
    var selectedIndexPath = -1
    var alarmAnimator: UIDynamicAnimator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        alarmAnimator = UIDynamicAnimator(referenceView: self.view)
        
        self.navigationController?.view.tintColor = UIColor(red: 0.93, green: 0.17, blue: 0.17, alpha: 1.0)
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor(red: 0.93, green: 0.17, blue: 0.17, alpha: 1.0)]
        UIApplication.shared().registerUserNotificationSettings(UIUserNotificationSettings(types: [.alert, .badge, .sound] , categories: nil))
        
        NotificationCenter.default().addObserver(self, selector: #selector(AlarmTableViewController.addingNewAlarm(_:)), name: AddingNewAlarmNotification, object: nil)
        NotificationCenter.default().addObserver(self, selector: #selector(AlarmTableViewController.deletingAlarm(_:)), name: DeletingAlarmNotification, object: nil)
        NotificationCenter.default().addObserver(self, selector: #selector(AlarmTableViewController.updatingAlarm(_:)), name: UpdatingAlarmNotification, object: nil)
        
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Alarms.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "", for: indexPath) as! AlarmTableCellView
        
        //View Configuration
        if Alarms[indexPath.row].alarmMinute < 10 {
            cell.alamTimeLabel.text = Alarms[indexPath.row].alarmHour.description + ": 0" + Alarms[indexPath.row].alarmMinute.description + "  AM"
        } else {
            cell.alamTimeLabel.text = Alarms[indexPath.row].alarmHour.description + ":" + Alarms[indexPath.row].alarmMinute.description + "  AM"
        }
        
        if let alarmName = Alarms[indexPath.row].alarmName {
            cell.alarmOptionsLabel.text = alarmName
        } else {
            cell.alarmOptionsLabel.text = "Alarm"
        }
        
        //Dynamics
        cell.cellAnimator = UIDynamicAnimator(referenceView: self.view)
        
        //Bounding Box
        cell.boundingBox = UICollisionBehavior(items: [cell])
        cell.boundingBox?.addBoundary(withIdentifier: "rightBoundary", from: CGPoint(x: cell.frame.size.width, y:  cell.frame.origin.y) , to: CGPoint(x: cell.frame.size.width, y: cell.frame.origin.y + cell.frame.size.height))
        cell.boundingBox?.addBoundary(withIdentifier: "leftBoundary", from: CGPoint(x: -cell.frame.size.width, y:  cell.frame.origin.y) , to: CGPoint(x: -cell.frame.size.width, y: cell.frame.origin.y + cell.frame.size.height))
        cell.boundingBox?.addBoundary(withIdentifier: "bottomBoundary", from: CGPoint(x: -cell.frame.size.width, y: cell.frame.origin.y + cell.frame.size.height), to: CGPoint(x: cell.frame.size.width, y: cell.frame.origin.y + cell.frame.size.height))
        cell.boundingBox?.addBoundary(withIdentifier: "topBoundary", from: CGPoint(x: -cell.frame.size.width, y: cell.frame.origin.y), to: CGPoint(x: cell.frame.size.width, y: cell.frame.origin.y))
        cell.cellAnimator?.addBehavior(cell.boundingBox!)
        
        //Spring
        cell.springNode = UIAttachmentBehavior(item: cell , attachedToAnchor: CGPoint(x: (cell.frame.width * 1.25) , y: (cell.frame.origin.y + (cell.frame.height/2))))
        cell.springNode?.length = cell.frame.width * (1.25/2)
        cell.springNode?.frequency = 0.6
        cell.cellAnimator?.addBehavior(cell.springNode!)
        
        //Elasticity
        cell.cellElasticity = UIDynamicItemBehavior(items: [cell])
        cell.cellElasticity?.elasticity = 0.125
        cell.cellAnimator?.addBehavior(cell.cellElasticity!)
        
        // Gesture
        let gesture = ChronoSwipeGesture.init(target: self, action: #selector(AlarmTableViewController.toggleAlarm(_:)))
        self.view.addGestureRecognizer(gesture)
        
        return cell
    }
    
 
    func addAlarm(notification: Notification) {
        
    }
    
    func updateAlarm(notification: Notification) {
        
    }
    
    func deleteAlarm(notification: Notification) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "AddAlarmSegue" {
            let destViewController = segue.destinationViewController as! AlarmDetailViewController
            destViewController.isNewAlarm = true
            
        } else if segue.identifier == "EditAlarmSegue" {
            let destViewController = segue.destinationViewController as! AlarmDetailViewController
            destViewController.isNewAlarm = false
            destViewController.alarmToConfig = Alarms[selectedIndexPath]
        }
    }
    
}
