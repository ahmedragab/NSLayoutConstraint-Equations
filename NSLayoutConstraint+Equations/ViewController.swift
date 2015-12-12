//
//  ViewController.swift
//  NSLayoutConstraint+Equations
//
//  Created by Ahmed Ragab on 12/12/15.
//  Copyright © 2015 QuaNode. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.removeConstraints(self.view.constraints);
        self.view.addConstraints(Top(label) == Top(button) |+ CenterX(label) == CenterX(self.view) |+ CenterY(label) == CenterY(self.view) |+ (Bottom(button) == Bottom(self.view) + 600)|10)
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

