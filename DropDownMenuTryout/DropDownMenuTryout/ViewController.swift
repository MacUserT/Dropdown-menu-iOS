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
    private var sportsList = ["RUNNING", "BIKING", "SWIMMING", "SKIING", "ROWING", "HIKING"]
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
	@IBOutlet weak var profileButton: UIButton!
	
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startMap.showsUserLocation = true
		startMap.userTrackingMode = .follow
		
		selectFirstSport()
		
        sportsSelectionTable.dataSource = sportSelectionDelegate
        sportsSelectionTable.delegate = sportSelectionDelegate
		sportSelectionDelegate.selectedSport = selectedSport
		sportSelectionDelegate.selectSportIcon()
		sportsSelectionTable.reloadData()
    }

	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		
		sportSelectionDelegate.setConstraintSize(for: sportsSelectionTable.constraints)
		profileButton.setStartButton(with: "PROFILE", and: UIImage(named: "ProfileIcon")!)
	}
	
	func selectFirstSport() {
		
		var maximumSport = 0
		let sportArray = [runningList, bikingList, swimmingList, skiingList, rowingList, hikingList]
		
		for (index, sport) in sportArray.enumerated() {
			if sport > maximumSport {
				selectedSport = sportsList[index]
				maximumSport = sport
			}
		}
	}
}

