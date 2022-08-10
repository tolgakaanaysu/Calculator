//
//  ViewController.swift
//  Calculator
//
//  Created by Tolga Kağan Aysu on 9.08.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var largeLabel: UILabel!
    @IBOutlet weak var operatorLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
 
    var result: Double = 0.0
    var temp: Double = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        largeLabel.text = "0"
    }
    //MARK: - Number Buttons
    @IBAction func zeroButton(_ sender: Any) {
        setLabelWithNumber(number: "0")
    }
    
    @IBAction func oneButton(_ sender: Any) {
        setLabelWithNumber(number: "1")
    }
    
    @IBAction func twoButton(_ sender: Any) {
        setLabelWithNumber(number: "2")
    }
    
    @IBAction func threeButton(_ sender: Any) {
        setLabelWithNumber(number: "3")
    }
    
    @IBAction func fourButton(_ sender: Any) {
        setLabelWithNumber(number: "4")
    }
    
    @IBAction func fiveButton(_ sender: Any) {
        setLabelWithNumber(number: "5")
    }
    
    @IBAction func sixButton(_ sender: Any) {
        setLabelWithNumber(number: "6")
    }
    
    @IBAction func sevenButton(_ sender: Any) {
        setLabelWithNumber(number: "7")
    }
    
    @IBAction func eightButton(_ sender: Any) {
        setLabelWithNumber(number: "8")
    }
    
    @IBAction func nineButton(_ sender: Any) {
        setLabelWithNumber(number: "9")
    }
    
    @IBAction func commaButton(_ sender: Any) {
        if largeLabel.text?.hasSuffix(".") == true {
            
        }
        else {
            setLabelWithNumber(number: ".")
        }
       
    }
    
    //MARK: - Operator button
    @IBAction func equalButton(_ sender: Any) {
        let op = getOperator()
        getLargeText()
        getTempText()
        switch op {
        case "+":
            temp += result
            break
        case "-":
            temp -= result
            break
        case "*":
            temp *= result
            break
        case "/":
            if result == 0 {
                setLargeLabelWithMessage(message: "Numbers can not divide zero")
                return
            }
            else {
                temp /= result
            }
            break
        default:
            return
        }
        
        
        tempLabel.text = ""
        operatorLabel.text = ""
        result = 0
        setLargeLabelWithResult(temp)
        temp = 0
    }
    
    @IBAction func plusButton(_ sender: Any) {
        guard !firstProcess(Operator: "+") else {
            return
        }
        getTempText()
        getLargeText()
        
        temp += result
        
        setOperatorLabel(opeartor: "+")
        setTempLabelWithResult(temp)
        setLargeLabelWithResult(0.0)
        
    }
    @IBAction func minusButton(_ sender: Any) {
        guard !firstProcess(Operator: "-") else {
            return
        }
        getTempText()
        getLargeText()
        
        temp -= result
        
        setOperatorLabel(opeartor: "-")
        setTempLabelWithResult(temp)
        setLargeLabelWithResult(0.0)
    }
    
    @IBAction func multiplyButton(_ sender: Any) {
        guard !firstProcess(Operator: "*") else {
            return
        }
        getTempText()
        getLargeText()
        
        temp *= result
        
        setOperatorLabel(opeartor: "*")
        setTempLabelWithResult(temp)
        setLargeLabelWithResult(0.0)
    }
    
    @IBAction func divideButton(_ sender: Any) {
        guard !firstProcess(Operator: "/") else {
            return
        }
        getTempText()
        getLargeText()
        guard result != 0 else {
            setLargeLabelWithMessage(message: "Numbers can not divide zero")
            return
        }
    
        temp /= result
        setOperatorLabel(opeartor: "/")
        setTempLabelWithResult(temp)
        setLargeLabelWithResult(0.0)
    }
    
    @IBAction func factorielButton(_ sender: Any) {
       
        guard let number = Float(largeLabel.text!) else {
            
           return
        }
        guard number.truncatingRemainder(dividingBy: 1.0) == 0 else{
            setLargeLabelWithMessage(message: "Please enter integer number")
            return
        }
        
        guard number < 14 else {
            setLargeLabelWithMessage(message: "Arithmetic overflow")
            return
        }
        
        guard number != 1.0 && number != 0.0 else {
            setLargeLabelWithResult(Double(1))
            return
        }
        
        guard number > 0 else  {
            setLargeLabelWithMessage(message: "Number can not negative")
            return
        }
            var sum = 1
            let resultInt = Int(number)
            for i in 1...resultInt {
                sum *= i
            }
            setLargeLabelWithResult(Double(sum))
    }
    
    @IBAction func deleteButton(_ sender: Any) {
        var text = largeLabel.text
        guard text != "" else  { return }
        text?.removeLast()
        largeLabel.text = text
        
    }
    
    @IBAction func acResetButton(_ sender: Any) {
        largeLabel.text = "0"
        tempLabel.text = ""
        operatorLabel.text = ""
        temp = 0
        result = 0
        largeLabel.font = UIFont.systemFont(ofSize: 60)
    }
    //MARK: - Setter functions
    func setLargeLabelWithResult(_ result: Double){
        if result.truncatingRemainder(dividingBy: 1.0) == 0 {
            largeLabel.text = String(Int(result))
        }
        else {
            largeLabel.text = String(result)
        }
    }
    
    func setTempLabelWithResult(_ result: Double){
        if result.truncatingRemainder(dividingBy: 1.0) == 0 {
            tempLabel.text = String(Int(result))
        }
        else {
            tempLabel.text = String(result)
        }

    }
    
    func setLabelWithNumber(number: String){
        var text = largeLabel.text!
        if text != "0" && text != "." {
            text += number
        }
        else {
            text = number
        }
        largeLabel.text = text
    }
    
    func setOperatorLabel(opeartor: String){
        operatorLabel.text = opeartor
    }
    
    func setLargeLabelWithMessage(message: String){
        tempLabel.text = ""
        operatorLabel.text = ""
        result = 0
        temp = 0
        largeLabel.font = UIFont.systemFont(ofSize: 25)
        largeLabel.text = message
    }
    
    //MARK: - getter Functions
    func getLargeText(){
        guard let large = Double(largeLabel.text!) else  {
            return
        }
        self.result = large
    }
    
    func getTempText(){
        guard let temp = Double(tempLabel.text!) else  {
            return
        }
        self.temp = temp
    }
    
    func getOperator() -> String {
        return operatorLabel.text!
    }
    
    func firstProcess(Operator: String)-> Bool{
        if tempLabel.text == "" {
            getLargeText()
            setOperatorLabel(opeartor: Operator)
            setTempLabelWithResult(result)
            setLargeLabelWithResult(0.0)
            return true
        }
        else {
            return false
        }
    }
}

