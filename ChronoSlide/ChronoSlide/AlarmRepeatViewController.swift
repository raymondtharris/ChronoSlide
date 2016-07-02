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
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "", for: indexPath)
        
        return cell
    }
}
