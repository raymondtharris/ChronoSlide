//
//  AlarmSongViewController.swift
//  ChronoSlide
//
//  Created by Tim Harris on 7/1/16.
//  Copyright © 2016 Tim Harris. All rights reserved.
//

import Foundation
import UIKit
import MediaPlayer

class AlarmSongViewController: UITableViewController {
    
    @IBOutlet var alarmSelectedSongView: SelectedSongView!
    
    lazy var alarmSongLibrary:[MPMediaItem] = MPMediaQuery.songs().items!
    var isNewAlarm: Bool = true
    var alarmToConfig: Alarm = Alarm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if alarmToConfig.alarmSound == nil {
            alarmSelectedSongView.isHidden = true
        }
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alarmSongLibrary.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AlarmSongTableCellView", for: indexPath)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
    }
}

class AlarmSongTableCellView: UITableViewCell {
    @IBOutlet weak var alarmSongTextLabel: UILabel!
    @IBOutlet weak var alarmSongImageView: UIImageView!
    
    var previewState: Bool = false
    
    
}
