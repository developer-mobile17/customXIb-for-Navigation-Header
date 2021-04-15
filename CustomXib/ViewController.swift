//
//  ViewController.swift
//  CustomXib
//
//  Created by wbmb on 14/04/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var personalView: NavigationHeaderView!
    override func viewDidLoad() {
        super.viewDidLoad()
        personalView.delegate = self
        personalView.lblHeader.text = "Test"
      
    }
}

extension ViewController: CustomViewDelegate {
    func backButtonPressed() {
        
        print("Back button Clicked")
        
    }
    
    func notificationButtonPressed() {
        
    }
    
    
}
