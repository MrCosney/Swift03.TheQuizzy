//
//  ViewController.swift
//  The Quiz
//
//  Created by Nick on 22.03.2021.
//

import UIKit

class StartViewController: UIViewController {
    private var musicIsOn = true
    override var prefersStatusBarHidden: Bool {
        return true
    }
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var musicButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    
    @IBOutlet weak var musicButtonHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var musicButtonWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var startButtonHeightConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Music.shared.play()
        // Setup View Font size
        mainLabel.font = mainLabel.font.withSize(
            min(view.bounds.size.width, view.bounds.size.height) / 7)
        startButton.titleLabel?.font = startButton.titleLabel?.font.withSize(
            min(view.bounds.size.width, view.bounds.size.height) / 12)
        
        //Setup Button and Background Images
        view.backgroundColor = UIColor(patternImage: UIImage(named: "background.jpg")!)
        musicButton.setBackgroundImage(UIImage(named: "soundButtonOn"), for: [])
        startButton.setBackgroundImage(UIImage(named: "selectButton"), for: [])
        
        //Setup the buttons size
        let buttonSize = view.frame.maxX / 8
        musicButtonWidthConstraint.constant = buttonSize
        musicButtonHeightConstraint.constant = buttonSize
        
        startButtonHeightConstraint.constant = view.frame.maxY / 10
    }
    /// Setup the Music Sound On/Off
    @IBAction func musicButtonPressed(_ sender: UIButton) {
        if musicIsOn {
            sender.setBackgroundImage(UIImage(named: "soundButtonOff"), for: [])
            Music.shared.stop()
        } else {
            sender.setBackgroundImage(UIImage(named: "soundButtonOn"), for: [])
            Music.shared.play()
        }
        musicIsOn.toggle()
    }
}
