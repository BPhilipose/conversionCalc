//
//  converterViewController.swift
//  Calculator
//
//  Created by Benson Philipose on 11/10/17.
//  Copyright © 2017 Benson Philipose. All rights reserved.
//

import UIKit

class converterViewController: UIViewController {
//    struct conversion {
//        var label: String
//        var inputType: String
//        var outputType: String
//    }
    var Conversion: [conversion] = [conversion]()
    

    var inputNumber = ""
    var outputNumber = ""
    var stringNumber: String = ""
    var negativeNumber = true
    
    var newConversion = conversion(label: "fahrenheit to celcius", inputType: "°F", outputType: "°C")

    @IBOutlet weak var outputDisplay: UITextField!
    @IBOutlet weak var inputDisplay: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Conversion = [
            conversion(label: "Fahrenheit to Celcius", inputType:   "°F", outputType: "°C"),
            conversion(label: "Celcius to Fahrenheit", inputType: "°C", outputType: "°F"),
            conversion(label: "Miles to Kilometers", inputType: "mi", outputType: "km"),
            conversion(label: "Kilometers to Miles", inputType: "k", outputType: "mi")]
        
        let loadConversion = Conversion[0]
        inputDisplay.text = loadConversion.inputType
        outputDisplay.text = loadConversion.outputType
        
    }
    
    
    @IBAction func convertButton(_ sender: UIButton) {
        let alert = UIAlertController(title:"Choose Conversion", message: nil, preferredStyle: UIAlertControllerStyle.actionSheet)
    
        for conversions in Conversion {
    alert.addAction(UIAlertAction(title: conversions.label, style: UIAlertActionStyle.default, handler: {
    (alertAction) -> Void in
        self.inputDisplay.text = self.inputNumber + " " + conversions.inputType
        self.outputDisplay.text = conversions.outputType
        self.newConversion.label = conversions.label
        self.newConversion.outputType = conversions.outputType
        self.newConversion.inputType = conversions.inputType
        if let input = Double(self.inputNumber){
            self.outputDisplay.text = self.calculation(input: input, currentConverter: self.newConversion)
            }
        }))
    }
        self.present(alert, animated: true, completion: nil)

    }
    
    
    
   //This function should link the numbers to its location on calc
    @IBAction func numPad(_ sender: UIButton) {
        
        inputNumber.append(sender.currentTitle!)
        inputDisplay.text = inputNumber + " " + newConversion.inputType
        if let input = Double(inputNumber){
            self.outputDisplay.text = calculation(input: input, currentConverter: newConversion)
        }
    }
        
    
    
    @IBAction func clearButton(_ sender: Any) {
//            inputNumber = 0
//            outputNumber = 0
            stringNumber = ""
        
        //Clear displays but have last preset converter type present
        
//        if outputDisplay.text!.contains("°C") {
//            inputDisplay.text = "°F"
//            outputDisplay.text = "°C"
//
        
        inputDisplay.text = "" + self.newConversion.inputType
        outputDisplay.text = "" + self.newConversion.outputType
        inputNumber = ""
}
    

    @IBAction func buttonPlusMinus(_ sender: Any) {
        if negativeNumber {
            inputNumber = "-" + inputNumber
            negativeNumber = false
        }else {
            inputNumber.removeFirst()
            negativeNumber = true
        }
        if let input = Double(inputNumber){
            self.inputDisplay.text = inputNumber + " " + newConversion.inputType
            self.outputDisplay.text = calculation(input: input, currentConverter: newConversion)
        }
    }
    //Clear the displays once clicked.
    func calculation(input: Double, currentConverter: conversion) -> String {
        var output = 0.0
        
        switch(currentConverter.label){
            
        case "FtoC":
            output = ((input - 32) * (5/9))
            
        case "CtoF":
            output = (input * (9/5)) + 32
            
        case "MItoKI":
            output = input * 1.609344
            
        case "KItoMI":
            output = input * 0.6214
            
        default:
            break
        }
        outputNumber = String.localizedStringWithFormat("%.2f", output) + " " + currentConverter.outputType
        return outputNumber
    }
    

    
    
    

    
    
    //Functions created for each possible conversion type
//
//    func CtoF (inputNumber: Double) -> Double {
//
//        let outputNumber = (inputNumber - 32) * (5/9)
//        return outputNumber
//    }
//
//    func FtoC (inputNumber: Double) -> Double {
//
//        let outputNumber = (inputNumber * (9/5) + 32)
//        return outputNumber
//    }
//
//    func KMtoMI (inputNumber: Double) -> Double {
//
//        let outputNumber = (inputNumber/1.60934)
//        return outputNumber
//    }
//
//    func MItoKM (inputNumber: Double) -> Double{
//
//        let outputNumber = (inputNumber * 1.60934)
//        return outputNumber
//    }
////    outputNumber = String.localizedStringWithFormat("%.2f", output) + " " + currentConverter.outputUnit
//    return outputNumber
//
//



    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
