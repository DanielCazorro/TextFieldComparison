//
//  MainModel.swift
//  TextFieldComparisonMVC
//
//  Created by Daniel Cazorro Frías on 11/1/24.
//

import Foundation

class MainModel {
    func compareTexts(_ text1: String?, _ text2: String?) -> String {
        guard let text1 = text1, let text2 = text2 else {
            return "Completa ambos textfields"
        }

        return text1 == text2 ? "Los textos son iguales" : "Los textos son diferentes"
    }
}
