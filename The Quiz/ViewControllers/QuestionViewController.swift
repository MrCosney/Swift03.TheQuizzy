//
//  QuestionViewController.swift
//  The Quiz
//
//  Created by Nick on 23.03.2021.
//

import UIKit

class QuestionViewController: UIViewController {
    
    //MARK: - Properties
    
    private var answersChosen = [Answer]()
    private var currentAnswer: [Answer] {
        currentQuestion.answers
    }
    private var currentQuestion: Question {
        Question.all[questionIndex]
    }
    private var fontSize: CGFloat = 10
    private var pickerAnswers = [String()]
    @IBOutlet weak var fontSizeCalcLabel: UILabel!
    private var questionIndex = 0
    
    
    @IBOutlet weak var confirmAnswerButton: UIButton!
    
    @IBOutlet weak var multipleStackView: UIStackView!
    @IBOutlet var multipleButtons: [UIButton]!
    
    @IBOutlet weak var singleStackView: UIStackView!
    @IBOutlet var singleButtons: [UIButton]!
    
    @IBOutlet weak var sliderStackView: UIStackView!
    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var pickerStackView: UIStackView!
    @IBOutlet weak var pickerView: UIPickerView!
    
    @IBOutlet weak var progressView: UIProgressView!
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    @IBOutlet weak var questionLabel: UILabel!
    
    // Height constraints for Confirm Button and Label
    @IBOutlet weak var questionLabelHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var confirmButtonHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var sliderStackViewHeightConstraint: NSLayoutConstraint!

    @IBOutlet weak var pickerStackViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var singleStackViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var multipleStackViewHeightConstraint: NSLayoutConstraint!
    // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        answersChosen.removeAll()
        questionWindowSettings()
        updateUI()
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
    
    // MARK: - Update View Functions
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
    ///Show and Update the StackViews depend on the Question Type
    private func updateSingleStackView() {
        singleStackView.isHidden = false
        confirmAnswerButton.isHidden = true
        for (button, answer) in zip(singleButtons, currentAnswer) {
            button.setTitle(answer.text, for: [])
        }
    }
    
    private func updateMultipleStackView() {
        multipleStackView.isHidden = false
        for (button, answer) in zip(multipleButtons, currentAnswer) {
            button.setTitle(answer.text, for: [])
        }
    }
    
    private func updateSliderView() {
        sliderStackView.isHidden = false
    }
    
    private func updatePickerView() {
        pickerStackView.isHidden = false
        pickerView.subviews[1].backgroundColor = UIColor.yellow.withAlphaComponent(0.15)
        
        //Add answers from Question List to pickerView array
        pickerAnswers = currentAnswer.compactMap { answer in
            return answer.text
        }
        pickerView.delegate = self
        pickerView.dataSource = self
    }
    // FIXME: -Fix status bar!!! Don't forget to clean the answer list after getting the result!!!
    
    // MARK: - View Elements Setup
    /// Set the Background Image and Font Colours to Array of  Buttons
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
    
    /// Calculate and setup the Sizes of Fonts, Colours and constraints for Confirm Button
    private func questionWindowSettings() {
        fontSize = min(fontSizeCalcLabel.frame.size.width, fontSizeCalcLabel.frame.size.height) / 15
        questionLabel.font = UIFont(name: "Thintel", size: CGFloat(fontSize + 3))
        //Setup colors
        navigationController?.navigationBar.barTintColor = UIColor(rgb: 0xA30EB3)
        view.backgroundColor = UIColor(patternImage: UIImage(named: "questionBackground.jpg")!)
        progressView.progressTintColor = UIColor(rgb: 0xA30EB3)
        
        //Setup Navigation Title
        let titleAttributes = [NSAttributedString.Key.font: UIFont(name: "Thintel", size: fontSize)]
        self.navigationController?.navigationBar.titleTextAttributes = titleAttributes as [NSAttributedString.Key : Any]
        
        //Setup Constraints
        confirmButtonHeightConstraint.constant = view.frame.maxY / 15
        questionLabelHeightConstraint.constant = view.frame.maxY / 10
        sliderStackViewHeightConstraint.constant = view.frame.maxY / 3
        pickerStackViewHeightConstraint.constant = view.frame.maxY / 3
        singleStackViewHeightConstraint.constant = view.frame.maxY / 3
        multipleStackViewHeightConstraint.constant = view.frame.maxY / 3
        //Setup Buttons
        confirmAnswerButton.titleLabel?.font = UIFont(name: "Thintel", size: fontSize)
        confirmAnswerButton.setBackgroundImage(UIImage(named: "confirmButton"), for: .normal)
        confirmAnswerButton.setTitleColor(.white, for: [])
        
        setupButtonsStyle(buttonArray: singleButtons)
        setupButtonsStyle(buttonArray: multipleButtons)
    }
    // MARK: - Actions
    @IBAction func singleButtonPressed(_ sender: UIButton) {
        let index = sender.tag
        let answers = Question.all[questionIndex].answers
        guard index >= 0 && index <= answers.count else { return }
        let answerSelected = answers[index]
        answersChosen.append(answerSelected)
        nextQuestion()
    }
    
    @IBAction func multipleButtonPressed(_ sender: UIButton) {
        sender.isSelected.toggle()
    }
    
    /// Append the Current Answer in Answers Array, depend on the type of the Question
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
        case .picker:
            answersChosen.append(currentAnswer[pickerView.selectedRow(inComponent: 0)])
        }
        nextQuestion()
    }
    
    @IBSegueAction func resultScreenSegue(_ coder: NSCoder) -> ResultViewController? {
        return ResultViewController(coder: coder, answersChosen)
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        let roundStepValue = round(sender.value / 1) * 1
        sender.value = roundStepValue
    }
}

// FIXME: Move to somewhere?!
extension QuestionViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return currentQuestion.answers.count
    }
    //Setup Text Color and Fonts in UIPicker
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var pickerLabel: UILabel? = (view as? UILabel)
        if pickerLabel == nil {
            pickerLabel = UILabel()
            pickerLabel?.font = UIFont(name: "Thintel", size: fontSize)
            pickerLabel?.textAlignment = .center
        }
        pickerLabel?.text = pickerAnswers[row]
        pickerLabel?.textColor = .white
        return pickerLabel!
    }
}
