import SwiftUI


enum CalculationErrorMessage {
    static let firstValueNonNumric = "一つ目の値が入力されていません"
    static let secondValueNonNumric = "二つ目の値が入力されていません"
}

var alertMessage = ""
var total = ""

func addCalculateButton(firstNumText: String, secondNumText: String) {
    guard let firsValue = Double(firstNumText) else {
        alertMessage = CalculationErrorMessage.firstValueNonNumric
        return
    }
    guard let secondValue = Double(secondNumText) else {
        alertMessage = CalculationErrorMessage.secondValueNonNumric
        return
    }
    total = String(firsValue + secondValue)
}

addCalculateButton(firstNumText: "3", secondNumText: "3")
