//
//  MainViewModel.swift
//  TextFieldComparison
//
//  Created by Daniel Cazorro Frías on 11/1/24.
//

import Foundation


// MARK: - Class -
class MainViewModel {
    
    // MARK: Properties
    weak var viewDelegate: MainViewDelegate?
    
    // MARK: Public Methods
    
    /// Notifica al ViewModel cuando un textField comienza a ser editado.
    func textFieldDidBeginEditing(isFirstTextField: Bool) {
        updateLabel(isFirstTextField: isFirstTextField)
    }
    
    /// Compara los textos ingresados y actualiza el label en consecuencia.
    func compareTexts(_ text1: String?, _ text2: String?) {
        guard let text1 = text1, let text2 = text2 else {
            // Al menos uno de los textfields está vacío
            viewDelegate?.updateLabel("Completa ambos textfields")
            return
        }
        
        if text1 == text2 {
            viewDelegate?.updateLabel("Los textos son iguales")
        } else {
            viewDelegate?.updateLabel("Los textos son diferentes")
        }
    }
    
    // MARK: Private Methods
    
    /// Actualiza el label con el mensaje correspondiente al textField activo.
    private func updateLabel(isFirstTextField: Bool) {
        if isFirstTextField {
            viewDelegate?.updateLabel("Escribiendo en el primer textField")
        } else {
            viewDelegate?.updateLabel("Escribiendo en el segundo textField")
        }
    }
}
