//
//  NavigationHeaderView.swift
//  CustomXib
//
//  Created by wbmb on 14/04/21.
//

import UIKit

protocol CustomViewDelegate: class {
    func backButtonPressed()
    func notificationButtonPressed()
}

class NavigationHeaderView: UIView {
    weak var delegate : CustomViewDelegate?
    
    /// To handle backbutton action using closure
        var backButtonPressed: (() -> Void)?
        @IBOutlet weak var backButton: UIButton!
    
    let KCONTENT_XIB_NAME = "NavigationHeaderView"

    @IBOutlet var ContentView: UIView!
    @IBOutlet weak var lblHeader: UILabel!
    
    @IBAction func actionBack(_ sender: Any) {
        if let _backButtonPressed = backButtonPressed {
            _backButtonPressed()
        } else {
            delegate?.backButtonPressed()
        }
    }
    
    @IBAction func actionNotificationClicked(_ sender: Any) {
        print("Notification Clicked ")
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        Bundle.main.loadNibNamed(KCONTENT_XIB_NAME, owner: self, options: nil)
        ContentView.fixInView(self)
        
    }
    
}


extension UIView {
    func fixInView(_ container:UIView!) -> Void {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.frame = container.frame
        container.addSubview(self)
        
        NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: container, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
                NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: container, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
                NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: container, attribute: .top, multiplier: 1.0, constant: 0).isActive = true
                NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: container, attribute: .bottom, multiplier: 1.0, constant: 0).isActive = true
    }
}
