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
    
    private var answersChosen = [Answer]()
    
    @IBOutlet weak var singleStackView: UIStackView!
    @IBOutlet var singleButtons: [UIButton]!
    
    @IBOutlet weak var multipleStackView: UIStackView!
    @IBOutlet var multipleButtons: [UIButton]!
    
    @IBOutlet weak var sliderStackView: UIStackView!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet var sliderLabels: [UILabel]!
    
    @IBOutlet weak var pickerStackView: UIStackView!
    @IBOutlet weak var pickerView: UIPickerView!
    
    @IBOutlet weak var progressView: UIProgressView!
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var confirmAnswerButton: UIButton!
    
    // Height constraints for Confirm Button and Label
    @IBOutlet weak var questionLabelHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var confirmButtonHeightConstraint: NSLayoutConstraint!
    //MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        questionWindowSettings()
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
        for button in multipleButtons {
            button.isSelected = false
        }
        confirmAnswerButton.isHidden = false
        
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
    private func updatePickerView() {
        
    }
    
    /// Set the Background Image and Font Colours to Buttons
    private func setupButtonsStyle(buttonArray: [UIButton]) {
        for (index, button) in buttonArray.enumerated() {
            button.setTitle(nil, for: [])
            button.tag = index
            button.setBackgroundImage(UIImage(named: "selectButton"), for: .normal)
            button.setBackgroundImage(UIImage(named: "selectButtonPressed"), for: .selected)
            button.setTitleColor(.white, for: .selected)
            button.titleLabel?.font = UIFont(name: "Thintel", size: fontSize)
            button.tintColor = .black
        }
    }
    ///Show and Update the StackView with Single Possible Answer
    private func updateSingleStackView() {
        singleStackView.isHidden = false
        confirmAnswerButton.isHidden = true
        setupButtonsStyle(buttonArray: singleButtons)
        for (button, answer) in zip(singleButtons, currentAnswer) {
            button.setTitle(answer.text, for: [])
        }
    }

    private func updateMultipleStackView() {
        multipleStackView.isHidden = false
        setupButtonsStyle(buttonArray: multipleButtons)
        for (button, answer) in zip(multipleButtons, currentAnswer) {
            button.setTitle(answer.text, for: [])
        }
    }
    
    private func updateSliderView() {
        sliderStackView.isHidden = false
        sliderLabels.first?.text = currentAnswer.first?.text
        sliderLabels.last?.text = currentAnswer.last?.text
    }
    
    // FIXME: -Fix status bar!!! Don't forget to clean the answer list after getting the result!!!
    
    private func questionWindowSettings() {
        fontSize = min(view.bounds.size.width, view.bounds.size.height) / 12
        questionLabel.font = UIFont(name: "Thintel", size: CGFloat(fontSize + 12))

        //Setup colors
        navigationController?.navigationBar.barTintColor = UIColor(rgb: 0xA30EB3)
        view.backgroundColor = UIColor(rgb: 0x171723)
        progressView.progressTintColor = UIColor(rgb: 0xA30EB3)
        
        //Setup Navigation Title
        let titleAttributes = [NSAttributedString.Key.font: UIFont(name: "Thintel", size: fontSize)]
        self.navigationController?.navigationBar.titleTextAttributes = titleAttributes as [NSAttributedString.Key : Any]
        
        //Setup Constraints
        confirmButtonHeightConstraint.constant = view.frame.maxY / 15
        questionLabelHeightConstraint.constant = view.frame.maxY / 10
        
        //Setup Confirm Button
        confirmAnswerButton.titleLabel?.font = UIFont(name: "Thintel", size: fontSize)
        confirmAnswerButton.setBackgroundImage(UIImage(named: "confirmButton"), for: .normal)
        confirmAnswerButton.setTitleColor(.white, for: [])
        
        //Setup slider Labels colors/font
        for label in sliderLabels {
            label.font = UIFont(name: "Thintel", size: fontSize)
            label.textColor = .white
        }
    }
    
    private func nextQuestion() {
        print(answersChosen)
        questionIndex += 1
        if questionIndex < Question.all.count {
            updateUI()
        } else {
            performSegue(withIdentifier: "Results Screen", sender: nil)
        }
    }
    
    @IBAction func singleButtonPressed(_ sender: UIButton) {
        let index = sender.tag
        let answers = Question.all[questionIndex].answers
        guard index >= 0 && index <= answers.count else {
            return
        }
        let answerSelected = answers[index]
        answersChosen.append(answerSelected)
        nextQuestion()
    }
    
    @IBAction func multipleButtonPressed(_ sender: UIButton) {
        sender.isSelected.toggle()
    }
    @IBAction func confirmAnswerPressed(_ sender: UIButton) {
        
        switch currentQuestion.type {
        case .single:
            break
        case .multiple :
            for (index, button) in multipleButtons.enumerated() {
                if button.isSelected && index < currentAnswer.count {
                    let answer = currentAnswer[index]
                    answersChosen.append(answer)
                }
            }
        case .slider:
            answersChosen.append(currentAnswer[Int(slider.value)])
        default:
            fatalError()
        }
        nextQuestion()
        }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        let roundStepValue = round(sender.value / 1) * 1
        sender.value = roundStepValue
    }
}
