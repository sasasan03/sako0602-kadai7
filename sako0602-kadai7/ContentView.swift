//
//  ContentView.swift
//  sako0602-kadai7
//
//  Created by sako0602 on 2022/12/11.
//

import SwiftUI

struct ContentView: View {
    
    @State private var addNumText1 = ""
    @State private var addNumText2 = ""
    @State private var subNumText1 = ""
    @State private var subNumText2 = ""
    @State private var addTotal = "Label"
    @State private var subTotal = "Label"
    @FocusState private var numberPadClose: Bool
    
    var body: some View {
        TabView {
            ZStack{
                Color.orange
                VStack{
                    NumInputView(numText1: $addNumText1, numText2: $addNumText2)
                        .focused($numberPadClose)
                    Button("Button") {
                        numberPadClose = false
                        additionalCalc()
                    }
                    Text("\(addTotal)")
                        .padding()
                }
            }
            .tabItem {
                Text("Item 1")
            }
            
            ZStack{
                Color.green
                VStack{
                    NumInputView(numText1: $subNumText1, numText2: $subNumText2)
                        .focused($numberPadClose)
                    Button("Button"){
                        numberPadClose = false
                        subtractionCalc()
                    }
                    Text("\(subTotal)")
                        .padding()
                }
            }
            .tabItem {
                Text("Item 2")
            }
        }
    }
    
    func additionalCalc() {
        let unwrappedAddNum1 = Int(addNumText1) ?? 0
        let unwrappedAddNum2 = Int(addNumText2) ?? 0
        addTotal = String(unwrappedAddNum1 + unwrappedAddNum2)
    }
    
    func subtractionCalc() {
        let unwrappedSubNum1 = Int(subNumText1) ?? 0
        let unwrappedSubNum2 = Int(subNumText2) ?? 0
        subTotal = String(unwrappedSubNum1 - unwrappedSubNum2)
    }
    
}

struct NumInputView: View {
    
    @Binding var numText1: String
    @Binding var numText2: String
    
    var body: some View {
        VStack {
            TextField("", text: $numText1)
                .keyboardType(.numberPad)
                .frame(width: 70,height: 50)
                .background(Color.white)
                .border(Color.black)
                .padding()
            TextField("", text: $numText2)
                .keyboardType(.numberPad)
                .frame(width: 70,height: 50)
                .background(Color.white)
                .border(Color.black)
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
