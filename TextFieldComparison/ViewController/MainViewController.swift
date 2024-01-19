//
//  MainViewController.swift
//  TextFieldComparison
//
//  Created by Daniel Cazorro Frías on 11/1/24.
//

import UIKit

// MARK: - MainViewDelegate Protocol
protocol MainViewDelegate: AnyObject {
    func updateLabel(_ text: String)
}

// MARK: - Class -
class MainViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var textFieldFirst: UITextField!
    @IBOutlet weak var textFieldSecond: UITextField!
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myButton: UIButton!
    
    // MARK: Properties
    let viewModel = MainViewModel()
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTextFields()
        configureTapGesture()
        viewModel.viewDelegate = self
    }
    
    // MARK: Private Methods
    
    /// Configura los delegados de los textFields y el gesto de toque.
    private func configureTextFields() {
        textFieldFirst.delegate = self
        textFieldSecond.delegate = self
    }
    
    /// Configura un gesto de toque para ocultar el teclado al tocar fuera de los textFields.
    private func configureTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        view.addGestureRecognizer(tapGesture)
    }
    
    /// Maneja el gesto de toque para ocultar el teclado.
    @objc private func handleTap() {
        view.endEditing(true)
    }
    
    
    // MARK: IBActions
    
    /// Acción del botón para comparar textos en los textFields.
    @IBAction func compareButtonTapped(_ sender: Any) {
        viewModel.compareTexts(textFieldFirst.text, textFieldSecond.text)
    }
}

// MARK: - UITextFieldDelegate
extension MainViewController: UITextFieldDelegate {
    
    /// Notifica al ViewModel cuando un textField comienza a ser editado.
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == textFieldFirst {
            viewModel.textFieldDidBeginEditing(isFirstTextField: true)
        } else if textField == textFieldSecond {
            viewModel.textFieldDidBeginEditing(isFirstTextField: false)
        }
    }
}

// MARK: - MainViewDelegate
extension MainViewController: MainViewDelegate {
    
    /// Actualiza el label con el texto proporcionado por el ViewModel.
    func updateLabel(_ text: String) {
        myLabel.text = text
    }
}
