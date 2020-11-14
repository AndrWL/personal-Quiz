//
//  ResultViewController.swift
//  lesson 4
//
//  Created by Andrey on 08.11.2020.
//

import UIKit


class ResultViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet var resultAnswerLabel: UILabel!
    @IBOutlet var resultDefenitionLabel: UILabel!
    
    // MARK: - Public properties
    var responses: [Answer]!
    override func viewDidLoad() {
        super.viewDidLoad()
        updateResult()
        navigationItem.hidesBackButton = true
    }
    private func updateResult() {
        
        var frequencyOfAnimal: [AnimalType: Int] = [:]
        let animals = responses.map { $0.type }
        
        for animal in animals {
            frequencyOfAnimal[animal] = (frequencyOfAnimal[animal] ?? 0) + 1
        }
        let sortedfrequencyOfAnimal = frequencyOfAnimal.sorted { $0.value > $1.value }
        
        guard  let mostFrequencyAnimal = sortedfrequencyOfAnimal.first?.key else { return }
        
        updateUI(with: mostFrequencyAnimal)
    }
    private func updateUI(with animal: AnimalType) {
        resultAnswerLabel.text = "Вы - \(animal.rawValue)"
        resultDefenitionLabel.text = "\(animal.definition)"
    }
    
}
