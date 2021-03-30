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
        imageView.image = UIImage(named: "let")
        imageViewHeightConstraint.constant = view.frame.height / 3
        navigationItem.hidesBackButton = true
        view.backgroundColor = UIColor(rgb: 0x171723)
        calculatePokemonResult()
    }
    
    private func calculatePokemonResult() {

        let frequencyOfAnswers = answers.reduce(into: [:]) { counts, answer in
            counts[answer.person, default: 0] += 1
        }
        let mostCommonAnswer = frequencyOfAnswers.sorted { $0.value > $1.value }.first!.key
        updateUI(with: mostCommonAnswer)
    }
    
    private func updateUI(with pokemon: PokemonType) {
        pokemonNameLabel.text = "Вы - \(pokemon.rawValue)!"
        pokemonDescriptionLabel.text = pokemon.description
    }

}
