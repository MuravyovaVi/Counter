//
//  ViewController.swift
//  Counter
//
//  Created by Vi Ka on 13.03.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var countUILabel: UILabel!
    
   
    @IBOutlet weak var plusUIButton: UIButton!
    
    
    @IBOutlet weak var minusUIButton: UIButton!
    
    
    @IBOutlet weak var refreshUIButton: UIButton!
    
    
    @IBOutlet weak var historyUITextView: UITextView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        historyUITextView.isEditable = false
        historyUITextView.isScrollEnabled = true
        addToHistory("История изменений:")
        updateCount()
    }

    private var count = 0
    
    private func updateCount() {
        countUILabel.text = "Значение счетчика: \(count)"
    }
    
    private func addToHistory(_ text: String) {
        historyUITextView.text.append("\(text)\n")
    }
   
    @IBAction func plusButtonTapped(_ sender: UIButton) {
        
        count += 1
        updateCount()
        addToHistory("\(Date()): значение изменено на +1")
    }
    
    @IBAction func minusButtonTapped(_ sender: UIButton) {
        if count > 0 {
            count -= 1
            updateCount()
            addToHistory("\(Date()): значение изменено на -1")
        } else {
            addToHistory("\(Date()): попытка уменьшить значение счётчика ниже 0")
        }
    }
    
    
    @IBAction func refreshButtonTapped(_ sender: UIButton) {
        count = 0
        updateCount()
        addToHistory("\(Date()): значение сброшено")
    }
}

