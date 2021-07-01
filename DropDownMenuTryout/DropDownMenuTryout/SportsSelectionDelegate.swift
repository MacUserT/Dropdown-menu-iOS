//
//  SportsSelectionDelegate.swift
//  DropDownMenuTryout
//
//  Created by Paul Hertroys on 12/07/2020.
//  Copyright © 2020 Paul Hertroys. All rights reserved.
//

import UIKit

class SportsSelectionDelegate: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //MARK: - Properties
    //Used variables
    var selectedSport = "RUNNING"
    private var isExtended = false
    private var selectedIcon = "RunnerIconGreenbg"
    private var sportsList = ["RUNNING", "BIKING", "SWIMMING", "SKIING", "ROWING", "HIKING"]
    private var sportIconList = ["RunnerIconGreenbg", "BikingIconPurplebg", "SwimingIconBluebg", "SkiingIconBluebg", "RowingIconOrangebg", "HikingIconPinkbg"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

		selectSportIcon()
    }
	
	func selectSportIcon() {
		
        for index in 0..<sportsList.count {
            if selectedSport == sportsList[index] {
                selectedIcon = sportIconList[index]
                return
            }
        }
	}
	
	func setConstraintSize(for constraints: [NSLayoutConstraint]) {
		
        for constraint in constraints {
            if constraint.identifier == "TableViewHeight" {
				isExtended ? (constraint.constant = 560) : (constraint.constant = 80)
            }
        }
	}
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isExtended {
            return sportsList.count
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if !isExtended {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Sport Activity", for: indexPath) as! SportActivityCell
            
            cell.sportIcon.image = UIImage(named: selectedIcon)
            cell.sportLabel.text = selectedSport
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Sport Selection", for: indexPath) as! SportSelectionCell
            
            cell.sportSelectionIcon.image = UIImage(named: sportIconList[indexPath.row])
            cell.sportSelectionLabel.text = sportsList[indexPath.row]
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		
		if isExtended {
			
			isExtended = false
			selectedSport = sportsList[indexPath.row]
			selectSportIcon()
			setConstraintSize(for: tableView.constraints)
			tableView.reloadData()
		} else {
			isExtended = true
			setConstraintSize(for: tableView.constraints)
			tableView.reloadData()
		}
	}
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
		if isExtended {
			
			let tableWidth = tableView.frame.size.width
			let headerLabel = UILabel(frame: CGRect(x: 0, y: 0, width: tableWidth, height: 80))
			headerLabel.backgroundColor = UIColor(red: 57.0/255.0, green: 212.0/255.0, blue: 84.0/255.0, alpha: 1.0)
			headerLabel.text = "SELECT WORKOUT"
			headerLabel.font = UIFont(name: "Futura-CondensedExtraBold", size: 24)
			headerLabel.textColor = .white
			headerLabel.textAlignment = .center
			
			return headerLabel
		} else {
			return UIView(frame: .zero)
		}
	}
	
	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		
		if isExtended {
			return 80
		} else {
			return 0
		}
	}
}
