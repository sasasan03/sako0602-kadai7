//
//  ExperimentView.swift
//  sako0602-kadai7
//
//  Created by sako0602 on 2022/12/12.
//

import SwiftUI

enum CalculationErrorMessage {
    static let firstValueNonNumric = "一つ目の値が入力されていません"
    static let secondValueNonNumric = "二つ目の値が入力されていません"
}

//final class AdditionModel {
//    func add(value1: Double, value2: Double) -> Double {
//        value1 + value2
//    }
//}

struct VarSe: View {
    
    @State private var firstNumText = ""
    @State private var secondNumText = ""
    @State private var total = "Label"
    @State private var showingAlert = false
    @State private var alertMessage = ""
    
    var body: some View {
        TabView {
            ZStack{
                Color.orange
                VStack{
                    NumInputView(numText1: $firstNumText, numText2: $secondNumText)
                    Button("Button"){
                        if firstNumText == "" || secondNumText == "" {
                            showingAlert = true
                        }
                        addCalculateButton()
                    }
                    .padding()
                    Text(total)
                }
                .padding()
            }
            .tabItem {
                Text("Item")
            }
            ZStack{
                Color.green
                VStack{
                    NumInputView(numText1: $firstNumText, numText2: $secondNumText)
                    Button("Button"){
                        if firstNumText == "" || secondNumText == "" {
                            showingAlert = true
                        }
                        subCalculateButton()
                    }
                    .padding()
                    Text(total)
                }
                .padding()
            }
            .tabItem {
                Text("Item")
            }
        }
        .alert(
            "課題７",
            isPresented: $showingAlert,
            presenting: alertMessage,
            actions: { _ in },
            message: { message in Text(message)}
        )
    }
    
    func addCalculateButton() {
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
    
    func subCalculateButton() {
        guard let firsValue = Double(firstNumText) else {
            alertMessage = CalculationErrorMessage.firstValueNonNumric
            return
        }
        guard let secondValue = Double(secondNumText) else {
            alertMessage = CalculationErrorMessage.secondValueNonNumric
            return
        }
        total = String(firsValue - secondValue)
    }
}

struct VerSe_Previews: PreviewProvider {
    static var previews: some View {
        VarSe()
    }
}
