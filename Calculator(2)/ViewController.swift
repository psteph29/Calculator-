//
//  ViewController.swift
//  Calculator(2)
//
//  Created by Paige Stephenson on 1/23/23.
//

import UIKit

class ViewController: UIViewController {
    
    
    enum Operator {
        case add
        case subtract
        case multiply
        case divide
        case percent
        case posOrNeg
        case start
    }
    
    var buttonValue = "0"
    
    @IBOutlet weak var label: UILabel!
    
    
    struct Buckets {
        var firstValue: Double
        var operand: Operator
        var secondValue: Double
        
    }
    
    var currentEquation = Buckets(firstValue: 0, operand: .start, secondValue: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
           // Do any additional setup after loading the view.
   
     }
    
    
    @IBAction func addition(_ sender: UIButton) {
        currentEquation.operand = .add
        buttonValue = "0"
    }
    
    func addForReal() -> Double {
        currentEquation.firstValue + currentEquation.secondValue
    }
    
    @IBAction func subtraction(_ sender: Any) {
        currentEquation.operand = .subtract
        buttonValue = "0"
    }
    
    func subtractForReal() -> Double {
        currentEquation.firstValue - currentEquation.secondValue
    }
    
    
    @IBAction func multiply(_ sender: Any) {
        currentEquation.operand = .multiply
        buttonValue = "0"
    }
    
    func multiplicationForReal() -> Double {
        currentEquation.firstValue * currentEquation.secondValue
    }
    
    @IBAction func divide(_ sender: Any) {
        currentEquation.operand = .divide
        buttonValue = "0"
    }
    
    func divideForReal() -> Double {
        currentEquation.firstValue / currentEquation.secondValue
    }
    
    @IBAction func oppositeValue(_ sender: Any) {
        currentEquation.operand = .posOrNeg
        doEquals()
        buttonValue = "0"
    }
    
    func makeOppositeValue() -> Double {
        currentEquation.firstValue * -1
    }
    
    @IBAction func percent(_ sender: Any) {
        currentEquation.operand = .percent
        doEquals()
        buttonValue = "0"
    }
    
    func makePercent() -> Double {
        currentEquation.firstValue / 100
    }
    
    
    func doEquals () {
        switch currentEquation.operand {
        case .add : label.text = String(addForReal())
            currentEquation.firstValue = addForReal()
            currentEquation.operand = .start
            buttonValue = "0"
        case .subtract : label.text = String(subtractForReal())
            currentEquation.firstValue = subtractForReal()
            currentEquation.operand = .start
            buttonValue = "0"
        case .multiply : label.text = String(multiplicationForReal())
            currentEquation.firstValue = multiplicationForReal()
            currentEquation.operand = .start
            buttonValue = "0"
        case .divide: label.text = String(divideForReal())
            currentEquation.firstValue = divideForReal()
            currentEquation.operand = .start
            buttonValue = "0"
        case .posOrNeg : label.text = String(makeOppositeValue())
            currentEquation.firstValue = makeOppositeValue()
            currentEquation.operand = .posOrNeg
            buttonValue = "0"
        case .percent : label.text = String(makePercent())
            currentEquation.firstValue = makePercent()
            currentEquation.operand = .start
            buttonValue = "0"
        case .start :
            return
        }
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        if Double(buttonValue) == 0 {
            buttonValue = sender.configuration!.title!
        } else {
            buttonValue += sender.configuration!.title!
        }
        switch currentEquation.operand {
        case .add, .subtract, .divide, .multiply, .percent, .posOrNeg : currentEquation.secondValue = Double(buttonValue) ?? 0
            updateUI(value: buttonValue)
        case .start: currentEquation.firstValue = Double(buttonValue) ?? 0
            updateUI(value: buttonValue)
        }
    }
    
    
    func updateUI(value: String) {
        label.text = value
    }
    
    
    @IBAction func pressedEquals(_ sender: Any) {
        doEquals()
        currentEquation.operand = .start
    }
    
    @IBAction func pressedClear(_ sender: Any) {
        currentEquation.operand = .start
        buttonValue = "0"
        label.text = "0"
    }
    
}
