//
//  ViewController.swift
//  MBGradientBackground
//
//  Created by cloudZon Infosoft on 29/09/17.
//  Copyright © 2017 MB. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var colorArray : [(firstColor: UIColor, secondColor: UIColor)] = []
    
    @IBOutlet weak var gradientView : MBView!
    var currentColorArrayIndex = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // An array of trupal colors
        colorArray.append((firstColor: #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1), secondColor: #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)))
        colorArray.append((firstColor: #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1), secondColor: #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)))
        colorArray.append((firstColor: #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1), secondColor: #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)))
        colorArray.append((firstColor: #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1), secondColor: #colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1)))
        colorArray.append((firstColor: #colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1), secondColor: #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)))
        colorArray.append((firstColor: #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1), secondColor: #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)))
        colorArray.append((firstColor: #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1), secondColor: #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)))
        
        // Begin animation
        self.animateGradientColor()
    }
    
    func animateGradientColor() {
        // Track the color index
        currentColorArrayIndex = (currentColorArrayIndex==(colorArray.count-1)) ? 0 : currentColorArrayIndex+1
        
        // UIView transition
        UIView.transition(with: gradientView, duration: 2, options: [.transitionCrossDissolve], animations: {
            self.gradientView.firstColor = self.colorArray[self.currentColorArrayIndex].firstColor
            self.gradientView.secondColor = self.colorArray[self.currentColorArrayIndex].secondColor
        }, completion: { success in
            // Here it is recursive
            self.animateGradientColor()
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

