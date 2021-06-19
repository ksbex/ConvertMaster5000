//
//  ContentView.swift
//  ConvertMaster5000
//
//  Created by Kevin Becker on 6/18/21.
//

import SwiftUI

struct ContentView: View {
    @State private var inputTemp = ""
    @State private var inputUnit = 0
    @State private var outputUnit = 0
    
    let tempUnits = ["Kelvin","Celsius","Fahrenheit"]
    
    var kelvinTemp: Double {
        let temp = Double(inputTemp) ?? 0
        switch inputUnit {
        case 0:
            //kelvin to kelvin
            return temp
        case 1:
            //celcius to kelvin
            return temp + 273.15
        case 2:
            //fahrenheit to kelvin
            return (temp + 459.67) * 5 / 9
        
        default:
            return 0
        }
    }
    
    var convertedTemp: Double {
        switch outputUnit {
        case 0:
            //output kelvin
            return kelvinTemp
        case 1:
            //output celcius
            return kelvinTemp - 273.15
        case 2:
            //output fahrenheit
            return kelvinTemp * 1.8 - 459.67
        
        default:
            return 0
            
        }
        
    }
    
    
    
    
    
    
    
    var body: some View {
        Form {
            Section(header: Text("Temperature to Convert")){
                TextField("Temperature", text: $inputTemp)
                    .keyboardType(.decimalPad)
                Picker("Units", selection: $inputUnit) {
                    ForEach(0 ..< tempUnits.count) {
                        Text("\(self.tempUnits[$0])")
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            Section(header: Text("Converted Temperature")){
                Text("\(convertedTemp, specifier: "%.1f") °")
            }
            Picker("Units", selection: $outputUnit){
                ForEach(0 ..< tempUnits.count) {
                    Text("\(self.tempUnits[$0])")
                }
            }
            .pickerStyle(SegmentedPickerStyle())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
