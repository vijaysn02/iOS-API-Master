//
//  ActivityIndicator.swift
//  API Master
//
//  Created by TPFLAP146 on 04/05/20.
//  Copyright © 2020 vijay. All rights reserved.
//

import Foundation
import UIKit


//MARK: - Activity Indicator or Loader
class Loader {
   
    static func show(vc:UIViewController) {
        DispatchQueue.main.async {
            ActivityIndicator.show(parentViewController: vc)
        }
    }
    static func hide(vc:UIViewController) {
        DispatchQueue.main.async {
            ActivityIndicator.hide(parentViewController: vc)
        }
    }
    
}

//MARK: - Activity Indicator
class ActivityIndicator {

    static let progressHUD = ProgressHUD(text: Constants.UserMessages.ACTIVITY_INDICATOR_TEXT)

    static func show(parentViewController:UIViewController) {
        DispatchQueue.main.async {
            progressHUD.tintColor = UIColor.white
            progressHUD.backgroundColor = UIColor.clear
            parentViewController.view.addSubview(progressHUD)
            progressHUD.show()
            parentViewController.view.isUserInteractionEnabled = false
        }
    }

    static func hide(parentViewController:UIViewController) {
        DispatchQueue.main.async {
            progressHUD.hide()
            progressHUD.removeFromSuperview()
            parentViewController.view.isUserInteractionEnabled = true
        }
    }
}


//MARK: - Progress HUD
class ProgressHUD: UIVisualEffectView {
    
    var text: String? {
        didSet {
            label.text = text
        }
    }
    
    let activityIndictor: UIActivityIndicatorView = UIActivityIndicatorView()
    
    let label: UILabel = UILabel()
    let blurEffect = UIBlurEffect(style: .light)
    let vibrancyView: UIVisualEffectView
    
    init(text: String) {
        self.text = text
        self.vibrancyView = UIVisualEffectView(effect: UIVibrancyEffect(blurEffect: blurEffect))
        super.init(effect: blurEffect)
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.text = ""
        self.vibrancyView = UIVisualEffectView(effect: UIVibrancyEffect(blurEffect: blurEffect))
        super.init(coder: aDecoder)
        self.setup()
    }
    
    func setup() {
        activityIndictor.style = UIActivityIndicatorView.Style.whiteLarge
        activityIndictor.color = Constants.ColorTheme.Dark
        contentView.addSubview(vibrancyView)
        contentView.addSubview(activityIndictor)
        //contentView.addSubview(label)
        activityIndictor.startAnimating()
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        
        if let superview = self.superview {
            
            let width: CGFloat = 50.0
            let height: CGFloat = 50.0
            self.frame = CGRect(x: superview.frame.size.width / 2 - width / 2,
                                y: superview.frame.height / 2 - height / 2,
                                width: width,
                                height: height)
            vibrancyView.frame = self.bounds
            
            let activityIndicatorSize: CGFloat = 40
            activityIndictor.frame = CGRect(x: 5,
                                            y: height / 2 - activityIndicatorSize / 2,
                                            width: activityIndicatorSize,
                                            height: activityIndicatorSize)
            layer.cornerRadius = 8.0
            layer.masksToBounds = true
            label.text = text
            label.textAlignment = NSTextAlignment.center
            label.frame = CGRect(x: activityIndicatorSize + 5,
                                 y: 0,
                                 width: width - activityIndicatorSize - 15,
                                 height: height)
            label.textColor = UIColor.white
            label.font = UIFont.boldSystemFont(ofSize: 16)
        }
    }
    
    func show() {
        self.isHidden = false
    }
    
    func hide() {
        self.isHidden = true
    }
}

