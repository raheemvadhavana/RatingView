//
//  ViewController.swift
//  RatingView
//
//  Created by admin on 03/12/19.
//  Copyright © 2019 Raheem Vadhavana. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet var ratingView: RatingView!
    @IBOutlet var rateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        ratingView.backgroundColor = UIColor.clear

        
        ratingView.delegate = self
        ratingView.contentMode = UIView.ContentMode.scaleAspectFit
        ratingView.type = .halfRatings
       
        segmentedControl.selectedSegmentIndex = 1
        rateLabel.text = String(format: "%.2f", self.ratingView.rating)
    }

    @IBAction func segmentValueChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            ratingView.type = .fullRatings
        case 1:
            ratingView.type = .halfRatings
        case 2:
            ratingView.type = .floatRatings
        default:
            ratingView.type = .fullRatings
        }
    }

}

extension ViewController: RatingViewDelegate {

    // MARK: FloatRatingViewDelegate
    
    func RatingView(_ ratingView: RatingView, isUpdating rating: Double) {
       print(rating)
    }
    
    func RatingView(_ ratingView: RatingView, didUpdate rating: Double) {
        rateLabel.text = String(format: "%.2f", self.ratingView.rating)
    }
    
}
