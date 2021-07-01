//
//  ViewController.swift
//  DropDownMenuTryout
//
//  Created by Paul Hertroys on 12/07/2020.
//  Copyright © 2020 Paul Hertroys. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    
    //MARK: - Properties
    //Used variables
    private var selectedSport = "RUNNING"
    private var sportSelectionDelegate = SportsSelectionDelegate()
    
    //Used constants
    let runningList = 8
    let bikingList = 5
    let swimmingList = 3
    let hikingList = 7
    let rowingList = 0
    let skiingList = 4

    //Outlets
    @IBOutlet weak var sportsSelectionTable: UITableView!
    @IBOutlet weak var startMap: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startMap.showsCompass = true
        startMap.mapType = .satellite
        startMap.showsTraffic = true
        startMap.showsBuildings = true
        startMap.showsUserLocation = true
        
        sportsSelectionTable.dataSource = sportSelectionDelegate
        sportsSelectionTable.delegate = sportSelectionDelegate
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        sportSelectionDelegate.changeHeightOfTable(for: sportsSelectionTable.constraints)
    }
}

