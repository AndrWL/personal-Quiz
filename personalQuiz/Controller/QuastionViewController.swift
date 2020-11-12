//
//  QuastionViewController.swift
//  lesson 4
//
//  Created by Andrey on 08.11.2020.
//

import UIKit

class QuastionViewController: UIViewController {
    
    @IBOutlet var quastionLabel: UILabel!
    @IBOutlet var singleStackView: UIStackView!
    @IBOutlet var singleButtoms: [UIButton]!
    
    @IBOutlet var multipleSwitches: [UISwitch]!
    @IBOutlet var multipleStackView: UIStackView!
    
    @IBOutlet var multipleLable: [UILabel]!
    @IBOutlet var rangedStackView: UIStackView!
    
    @IBOutlet var rangeLabels: [UILabel]!
    @IBOutlet var rangeSlider: UISlider!
    
    @IBOutlet var quastionsProgressView: UIProgressView!
    
    // Mark private - proporties
    private let quastions = Question.getQuestions()
    private var questionIndex = 0

    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
 
    
    // Mark private Methods
    
    // update user interface
    
    private func updateUI() {
        // Hide everything
         
        for stackView in [singleStackView, multipleStackView, rangedStackView] {
            stackView?.isHidden = true
        }
        
        // Get current quastion
        
        let currentQuastion = quastions[questionIndex]
        
        // Set current quastion for quastion label
        
        quastionLabel.text = currentQuastion.text
        
        // Set progress to the quastionProgressView
        let totalProgress = Float(questionIndex / quastions.count)
        
        // Calculate progress
        quastionsProgressView.setProgress(totalProgress, animated: true)
        // Set navigation title
        
        title = " Вопрос № \( questionIndex + 1) из  \(quastions.count)"
        
        // Show stack view correspondenting to question type
        
        let currentAnswers = currentQuastion.answers
        
        switch currentQuastion.type {
        case .single:
            updateSingleStackView(using: currentAnswers)
        case .multiple:
            break
        case .ranged:
            break
        
        }
        
        
    }
    
    /// setup single stack View
    /// - Parameter answers: - array with answers
    ///
    /// Description of method
    private func updateSingleStackView(using answers: [Answer]) {
        // show single stack View
        singleStackView.isHidden = false
    }

}

