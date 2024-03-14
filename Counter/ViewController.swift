//
//  ViewController.swift
//  Counter
//
//  Created by Vi Ka on 13.03.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var countUILabel: UILabel!
    
   
    @IBOutlet private weak var plusUIButton: UIButton!
    
    
    @IBOutlet private weak var minusUIButton: UIButton!
    
    
    @IBOutlet private weak var refreshUIButton: UIButton!
    
    
    @IBOutlet private weak var historyUITextView: UITextView!
    
    private var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        historyUITextView.isEditable = false
        historyUITextView.isScrollEnabled = true
        addToHistory("История изменений:")
        updateCount()
    }
    
    private func updateCount() {
        countUILabel.text = "Значение счетчика: \(count)"
    }
    
    private func addToHistory(_ text: String) {
        historyUITextView.text.append("\(text)\n")
    }
   
    @IBAction private func plusButtonTapped(_ sender: UIButton) {
        
        count += 1
        updateCount()
        addToHistory("\(Date()): значение изменено на +1")
    }
    
    @IBAction private func minusButtonTapped(_ sender: UIButton) {
        if count > 0 {
            count -= 1
            updateCount()
            addToHistory("\(Date()): значение изменено на -1")
        } else {
            addToHistory("\(Date()): попытка уменьшить значение счётчика ниже 0")
        }
    }
    
    
    @IBAction private func refreshButtonTapped(_ sender: UIButton) {
        count = 0
        updateCount()
        addToHistory("\(Date()): значение сброшено")
    }
}

