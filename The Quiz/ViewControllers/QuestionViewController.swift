//
//  QusetionViewController.swift
//  The Quiz
//
//  Created by Nick on 23.03.2021.
//

import UIKit

class QuestionViewController: UIViewController {

    private var questionIndex = 0
    
    @IBOutlet weak var multipleStackView: UIStackView!
    @IBOutlet weak var singleStackView: UIStackView!
    @IBOutlet weak var sliderStackView: UIStackView!
    @IBOutlet weak var pickerStackView: UIStackView!
    
    @IBOutlet var singleButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBarSettings()
    }
    
    private func setupNavBarSettings(){
        //Setup colors
        navigationController?.navigationBar.barTintColor = UIColor(rgb: 0xFFC107)
        view.backgroundColor = UIColor(rgb: 0x171723)
        
        //Setup Navigation Title
        let fontSize = min(view.bounds.size.width, view.bounds.size.height) / 12
        let titleAttributes = [NSAttributedString.Key.font: UIFont(name: "Thintel", size: fontSize)]
        self.navigationController?.navigationBar.titleTextAttributes = titleAttributes as [NSAttributedString.Key : Any]
    }
    

}
