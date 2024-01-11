//
//  MainViewController.swift
//  TextFieldComparisonMVC
//
//  Created by Daniel Cazorro Frías on 11/1/24.
//

import UIKit

class MainViewController: UIViewController {
    
    // Model
    var model = MainModel()
    
    // IBOutlets
    
    @IBOutlet weak var firstTextField: UITextField!
    @IBOutlet weak var secondTextField: UITextField!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // label
        label.text = ""
        
        firstTextField.delegate = self
        secondTextField.delegate = self
    }



    // IBActions
    
    @IBAction func buttonTap(_ sender: Any) {
        let result = model.compareTexts(firstTextField.text, secondTextField.text)
        label.text = result
    }
    
}

// MARK: - UITextFieldDelegate
extension MainViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        // Muestra el mensaje correspondiente al comenzar la edición
        if textField == firstTextField {
            label.text = "Escribiendo en Field 1"
        } else if textField == secondTextField {
            label.text = "Escribiendo en Field 2"
        }
    }
}
