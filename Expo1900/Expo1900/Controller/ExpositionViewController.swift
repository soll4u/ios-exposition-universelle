//
//  Expo1900 - ExpositionViewController.swift
//  Created by Marco, Soll, Yescoach.
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ExpositionViewController: UIViewController {
    
    // MARK: @IBOutlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var visitorsLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    // MARK: Properties
    var exposition: Exposition? {
        didSet {
            self.updateUI()
        }
    }
    let numberFormatter = NumberFormatter()
    let expositionDataIdentifier = "exposition_universelle_1900"
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        numberFormatter.numberStyle = .decimal
        
        let jsonDecoder = JSONDecoder()
        guard let dataAsset = NSDataAsset(name: expositionDataIdentifier) else {
            return
        }
        do {
            self.exposition = try jsonDecoder.decode(Exposition.self, from: dataAsset.data)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    // MARK: Functions
    func updateUI() {
        titleLabel.text = exposition?.title
        guard let stringNumber = numberFormatter.string(from: NSNumber(value: (exposition?.visitors)!)) else {
            return
        }
        visitorsLabel.text = stringNumber
        locationLabel.text = exposition?.location
        durationLabel.text = exposition?.duration
        descriptionLabel.text = exposition?.description
    }
}