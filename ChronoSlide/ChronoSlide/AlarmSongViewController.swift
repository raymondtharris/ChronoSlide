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
        
        if searchbarController.isActive && searchbarController.searchBar.text != "" {
            cell.alarmSongTextLabel.text = filteredSongArray[(indexPath as NSIndexPath).row].title!
            cell.alarmSongImageView.image = filteredSongArray[(indexPath as NSIndexPath).row].artwork?.image(at: cell.alarmSongImageView.frame.size)
        } else {
            cell.alarmSongTextLabel.text = songArray[(indexPath as NSIndexPath).row].title!
            cell.alarmSongImageView.image = songArray[(indexPath as NSIndexPath).row].artwork?.image(at: cell.alarmSongImageView.frame.size)
        }
        cell.alarmSongImageView.isUserInteractionEnabled = true
        
        // Choose Song Gesture
        let chooseGesture = UITapGestureRecognizer.init(target: self, action: #selector(AddSongsTableViewController.chooseSong(_:)))
        self.view.addGestureRecognizer(chooseGesture)
        
        // Preview Song Gesutre
        let previewGesture = UITapGestureRecognizer.init(target: self, action: #selector(AddSongsTableViewController.togglePreview(_:)))
        cell.alarmSongImageView.addGestureRecognizer(previewGesture)
    }
    
    
}

extension AlarmSongViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterSongs(searchController.searchBar.text!)
    }
    
    func filterSongs(_ searchString: String){
        //print(searchString)
        filteredSongArray = songArray.filter { song in
            return (song.title!.lowercased().contains(searchString.lowercased()))
        }
        tableView.reloadData()
    }
}

class AlarmSongTableCellView: UITableViewCell {
    @IBOutlet weak var alarmSongTextLabel: UILabel!
    @IBOutlet weak var alarmSongImageView: UIImageView!
    
    var previewState: Bool = false
    
    
}
