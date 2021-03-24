//
//  QusetionViewController.swift
//  The Quiz
//
//  Created by Nick on 23.03.2021.
//

import UIKit

class QuestionViewController: UIViewController {
    
    //MARK: - Properties
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    private var fontSize: CGFloat = 10
    private var questionIndex = 0
    private var currentAnswer: [Answer] {
        currentQuestion.answers
    }
    private var currentQuestion: Question {
        Question.all[questionIndex]
    }
    
    @IBOutlet weak var singleStackView: UIStackView!
    @IBOutlet var singleButtons: [UIButton]!
    
    @IBOutlet weak var multipleStackView: UIStackView!
    @IBOutlet var multipleSwitchers: [UISwitch]!
    @IBOutlet var multipleLabels: [UILabel]!
    
    
    @IBOutlet weak var sliderStackView: UIStackView!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet var sliderLabels: [UILabel]!
    
    @IBOutlet weak var pickerStackView: UIStackView!
    @IBOutlet weak var pickerView: UIPickerView!
    
    @IBOutlet weak var progressView: UIProgressView!
    
    @IBOutlet weak var questionLabel: UILabel!
    
    //MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        fontSize = min(view.bounds.size.width, view.bounds.size.height) / 12
        slider.maximumValue = 0.99999
        questionLabel.font = UIFont(name: "Thintel", size: CGFloat(fontSize + 12))
        setupNavBarSettings()
        updateUI()
    }
    
    private func updateUI() {
        let progress = Float(questionIndex) / Float(Question.all.count)
        navigationItem.title = "Вопрос  # \(questionIndex + 1)"
        questionLabel.text = currentQuestion.text
        progressView.setProgress(progress, animated: true)
        
        for stackView in [singleStackView, multipleStackView, sliderStackView, pickerStackView] {
            stackView?.isHidden = true
        }
        switch currentQuestion.type {
        case .single:
            updateSingleStackView()
        case .multiple:
            updateMultipleStackView()
        case .slider:
            updateSliderView()
        case .picker:
            updatePickerView()
        }
        
    }
    
    private func updateSliderView() {
    }
    
    private func updatePickerView() {
        
    }
    private func updateMultipleStackView() {
        multipleStackView.isHidden = false
    }
    
    ///Show and Update the StackView with Single Possible Answer
    private func updateSingleStackView() {
        singleStackView.isHidden = false
        for (index, button) in singleButtons.enumerated() {
            button.setTitle(nil, for: [])
            button.tag = index
            button.setBackgroundImage(UIImage(named: "selectButton"), for: [])
            button.titleLabel?.font = UIFont(name: "Thintel", size: fontSize)
            button.tintColor = .black
        }
        for (button, answer) in zip(singleButtons, currentAnswer) {
            button.setTitle(answer.text, for: [])
        }
    }
    
    // FIXME: -Fix status bar!!!
    
    private func setupNavBarSettings(){
        //Setup colors
        navigationController?.navigationBar.barTintColor = UIColor(rgb: 0x5A40D6)
        view.backgroundColor = UIColor(rgb: 0x171723)
        progressView.progressTintColor = UIColor(rgb: 0x5A40D6)
        
        //        //Setup Navigation Title
        let titleAttributes = [NSAttributedString.Key.font: UIFont(name: "Thintel", size: fontSize)]
        self.navigationController?.navigationBar.titleTextAttributes = titleAttributes as [NSAttributedString.Key : Any]
    }
    
    
}
