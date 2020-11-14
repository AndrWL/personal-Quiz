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
    @IBOutlet var singleButtons: [UIButton]!
    
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
    private var answersChoosen: [Answer] = []
    
    
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
        let totalProgress = Float(Float(questionIndex) / Float(quastions.count))
        
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
            updateMultipleStackView(using: currentAnswers)
        case .ranged:
            updateRangedStackView(using: currentAnswers)
        
        }
        
        
    }
    // Mark : - IB Actions
    
    @IBAction func singleAnswerButtonPressed(_ sender: UIButton) {
        let currentAnswers = quastions[questionIndex].answers
        guard let currentIndex = singleButtons.firstIndex(of: sender) else { return }
        
       let currentAnswer = currentAnswers[currentIndex]
        answersChoosen.append(currentAnswer)
        nextQuestion()
        
    }
    
    @IBAction func multipleAnswerAction() {
        
       let currentAnswers = quastions[questionIndex].answers
        for (multipleSwitch, answer) in zip(multipleSwitches, currentAnswers) {
            if multipleSwitch.isOn {
                answersChoosen.append(answer)
            }
            
        }
        nextQuestion()
    }
    
    @IBAction func rangeAnswersButtonPressed() {
        
        let currentAnswers = quastions[questionIndex].answers
        let index = Int(rangeSlider.value * Float(currentAnswers.count - 1))
        answersChoosen.append(currentAnswers[index])
        nextQuestion()
    }
    
    
    /// Setup single stack View
    /// - Parameter answers: - array with answers
    ///
    /// Description of method
    
    private func updateSingleStackView(using answers: [Answer]) {
        // show single stack View
        singleStackView.isHidden = false
        
       for (button, answer) in zip(singleButtons, answers) {
        button.setTitle(answer.text, for: .normal )
       }
    }
    
    /// Setup multiple stack View
    /// - Parameter answers: - array with answers
    ///
    /// Description of method
    
    private func updateMultipleStackView(using answers: [Answer]) {
        // show multiple stack View
        multipleStackView.isHidden = false
        for (label, answer) in zip(multipleLable, answers) {
            label.text = answer.text
        }
    }
    
    
    /// Setup ranged
    /// - Parameter answers: - array with answers
    ///
    /// Description of method
    
    private func updateRangedStackView(using answers: [Answer]) {
        // show ranged stack View
        rangedStackView.isHidden = false
        
        rangeLabels.first?.text = answers.first?.text
        rangeLabels.last?.text = answers.last?.text
    }
    
    //  Mark: Show next question or go to the next screen

    private func nextQuestion(){
        
        // Todo: Implement the function
        
        questionIndex += 1
        
        if questionIndex < quastions.count {
            updateUI()
        } else {
            performSegue(withIdentifier: "resultSegue", sender: nil)
        }
        
            
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "resultSegue" else { return }
        let resultVC = segue.destination as! ResultViewController
        resultVC.responses = answersChoosen
    }

}

