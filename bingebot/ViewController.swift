//
//  ViewController.swift
//  bingebot
//
//  Created by minti on 3/11/19.
//  Copyright © 2019 studiominti. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var taskLabel: UILabel!
    @IBOutlet weak var randomTaskLabel: UILabel!
    @IBOutlet weak var bingebotSpokenLabel: UILabel!
    @IBOutlet weak var addTaskTextField: UITextField!
    @IBOutlet weak var addTaskButton: UIButton!
    @IBOutlet weak var randomTaskStackView: UIStackView!
    @IBOutlet weak var addTaskStackView: UIStackView!
    @IBOutlet weak var tasksStackView: UIStackView!
    @IBOutlet weak var clearButton: UIButton!
    
    var tasks: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tasksStackView.isHidden = true
        randomTaskStackView.isHidden = true
        clearButton.isHidden = true
    }

    func updateTaskLabel() {
        taskLabel.text = tasks.joined(separator: ", ")
    }
    
    func clearTextLabel(){
        taskLabel.text = ""
        tasks = []
    }
    
    @IBAction func randomTaskBingeButtonPressed(_ sender: Any) {
    randomTaskLabel.text = tasks.randomElement()
    randomTaskLabel.isHidden = false
    bingebotSpokenLabel.isHidden = false
    }
    
    @IBAction func addTaskButtonPressed(_ sender: Any) {
        guard let taskName = addTaskTextField.text else { return }
        tasks.append(taskName)
        updateTaskLabel()
        addTaskTextField.text = ""
        tasksStackView.isHidden = false
        clearButton.isHidden = false
        
        if tasks.count > 1 {
            randomTaskStackView.isHidden = false
            randomTaskLabel.isHidden = true
            bingebotSpokenLabel.isHidden = true
        }
    }
    
    @IBAction func clearButtonPressed(_ sender: Any) {
        clearTextLabel()
        randomTaskStackView.isHidden = true
        
    }
}

