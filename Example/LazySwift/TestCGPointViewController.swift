//
//  ViewController.swift
//  LazySwift
//
//  Created by killing333 on 01/11/2016.
//  Copyright (c) 2016 killing333. All rights reserved.
//

import UIKit
import LazySwift

class TestCGPointViewController: UITableViewController {
	@IBOutlet var negationCell: UITableViewCell!
	@IBOutlet var additionScalarCell: UITableViewCell!
	@IBOutlet var additionScalarAssignmentCell: UITableViewCell!
	@IBOutlet var additionVectorCell: UITableViewCell!
	@IBOutlet var additionVectorAssignmentCell: UITableViewCell!
	@IBOutlet var subtractionScalarCell: UITableViewCell!
	@IBOutlet var subtractionScalarAssignmentCell: UITableViewCell!
	@IBOutlet var subtractionVectorCell: UITableViewCell!
	@IBOutlet var subtractionVectorAssignmentCell: UITableViewCell!
	@IBOutlet var mulitplicationScalarCell: UITableViewCell!
	@IBOutlet var mulitplicationScalarAssignmentCell: UITableViewCell!
	@IBOutlet var divisionScalarCell: UITableViewCell!
	@IBOutlet var divisionScalarAssignmentCell: UITableViewCell!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
		
		var testPoint1: CGPoint, testPoint2: CGPoint
		// Negation
		testPoint1 = CGPointMake(5, 10)
		negationCell.textLabel?.text = "-\(testPoint1)"
		negationCell.detailTextLabel?.text = "\(-testPoint1)"
		
		// Addition
		testPoint1 = CGPointMake(3, 12)
		additionScalarCell.textLabel?.text = "\(testPoint1) + 7"
		additionScalarCell.detailTextLabel?.text = "\(testPoint1 + 7)"
		
		testPoint1 = CGPointMake(6, 9)
		additionScalarAssignmentCell.textLabel?.text = "\(testPoint1) += 8"
		testPoint1 += 8
		additionScalarAssignmentCell.detailTextLabel?.text = "\(testPoint1)"
		
		testPoint1 = CGPointMake(11, 8)
		testPoint2 = CGPointMake(4, 6)
		additionVectorCell.textLabel?.text = "\(testPoint1) + \(testPoint2)"
		additionVectorCell.detailTextLabel?.text = "\(testPoint1 + testPoint2)"
		
		testPoint1 = CGPointMake(22, 13)
		testPoint2 = CGPointMake(9, 3)
		additionVectorAssignmentCell.textLabel?.text = "\(testPoint1) += \(testPoint2)"
		testPoint1 += testPoint2
		additionVectorAssignmentCell.detailTextLabel?.text = "\(testPoint1)"
		
		// Subtraction
		testPoint1 = CGPointMake(3, 12)
		subtractionScalarCell.textLabel?.text = "\(testPoint1) - 7"
		subtractionScalarCell.detailTextLabel?.text = "\(testPoint1 - 7)"
		
		testPoint1 = CGPointMake(6, 9)
		subtractionScalarAssignmentCell.textLabel?.text = "\(testPoint1) -= 8"
		testPoint1 -= 8
		subtractionScalarAssignmentCell.detailTextLabel?.text = "\(testPoint1)"
		
		testPoint1 = CGPointMake(11, 8)
		testPoint2 = CGPointMake(4, 6)
		subtractionVectorCell.textLabel?.text = "\(testPoint1) - \(testPoint2)"
		subtractionVectorCell.detailTextLabel?.text = "\(testPoint1 - testPoint2)"
		
		testPoint1 = CGPointMake(22, 13)
		testPoint2 = CGPointMake(9, 3)
		subtractionVectorAssignmentCell.textLabel?.text = "\(testPoint1) -= \(testPoint2)"
		testPoint1 -= testPoint2
		subtractionVectorAssignmentCell.detailTextLabel?.text = "\(testPoint1)"
		
		// Mulitplication
		testPoint1 = CGPointMake(7, 9)
		mulitplicationScalarCell.textLabel?.text = "\(testPoint1) * 6"
		mulitplicationScalarCell.detailTextLabel?.text = "\(testPoint1 * 6)"
		
		testPoint1 = CGPointMake(11, 4)
		mulitplicationScalarAssignmentCell.textLabel?.text = "\(testPoint1) *= 5"
		testPoint1 *= 5
		mulitplicationScalarAssignmentCell.detailTextLabel?.text = "\(testPoint1)"
		
		// Division
		testPoint1 = CGPointMake(7, 9)
		divisionScalarCell.textLabel?.text = "\(testPoint1) / 5"
		divisionScalarCell.detailTextLabel?.text = "\(testPoint1 / 5)"
		
		testPoint1 = CGPointMake(11, 4)
		divisionScalarAssignmentCell.textLabel?.text = "\(testPoint1) /= 4"
		testPoint1 /= 4
		divisionScalarAssignmentCell.detailTextLabel?.text = "\(testPoint1)"
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

