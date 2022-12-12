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
                    AddNumInputView(addNumText1: $addNumText1, addNumText2: $addNumText2)
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
                    SubNumInputView(subNumText1: $subNumText1, subNumText2: $subNumText2)
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

struct AddNumInputView: View {
    
    @Binding var addNumText1: String
    @Binding var addNumText2: String
    
    var body: some View {
        VStack {
            TextField("", text: $addNumText1)
                .keyboardType(.numberPad)
                .frame(width: 70,height: 50)
                .background(Color.white)
                .border(Color.black)
                .padding()
            TextField("", text: $addNumText2)
                .keyboardType(.numberPad)
                .frame(width: 70,height: 50)
                .background(Color.white)
                .border(Color.black)
                .padding()
        }
    }
}

struct SubNumInputView: View {
    
    @Binding var subNumText1: String
    @Binding var subNumText2: String
    
    var body: some View {
        VStack {
            TextField("", text: $subNumText1)
                .keyboardType(.numberPad)
                .frame(width: 70,height: 50)
                .background(Color.white)
                .border(Color.black)
                .padding()
            TextField("", text: $subNumText2)
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
