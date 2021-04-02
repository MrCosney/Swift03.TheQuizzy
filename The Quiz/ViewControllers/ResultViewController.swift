//
//  ResultViewController.swift
//  The Quiz
//
//  Created by Nick on 23.03.2021.
//

import UIKit

class ResultViewController: UIViewController {


    @IBOutlet weak var imageViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var pokemonNameLabel: UILabel!
    @IBOutlet weak var pokemonDescriptionLabel: UILabel!
    
    let answers: [Answer]
    
    init?(coder: NSCoder, _ answers: [Answer]) {
        self.answers = answers
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Setup font size for Labels
        let fontSize = min(view.bounds.size.width, view.bounds.size.height) / 12

        pokemonNameLabel.font = UIFont(name: "Thintel", size: CGFloat(fontSize + 15))
        pokemonNameLabel.textColor = .yellow
        pokemonDescriptionLabel.font = UIFont(name: "Thintel", size: CGFloat(fontSize + 5))
        
        imageViewHeightConstraint.constant = view.frame.height / 3
        navigationItem.hidesBackButton = true
        view.backgroundColor = UIColor(patternImage: UIImage(named: "questionBackground.jpg")!)
        updateUI()
    
    }
    
    private func updateUI() {
        let answersPoints = answers.reduce(into: [:]) { counts, answer in
            counts[answer.person, default: 0] += 1
        }
        let resultedPokemon = answersPoints.sorted { $0.value > $1.value }.first!.key
        
        pokemonNameLabel.text = "Ты - \(resultedPokemon.rawValue)!"
        imageView.image = UIImage(named: String(resultedPokemon.rawValue))
        pokemonDescriptionLabel.text = resultedPokemon.description
    }

}
