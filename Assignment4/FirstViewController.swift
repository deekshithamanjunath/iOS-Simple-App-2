//
//  FirstViewController.swift
//  Assignment4
//
//  Created by Deekshitha Manjunath on 10/23/16.
//  Copyright © 2016 Deekshitha Manjunath. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet var picker: UIPickerView!
    
    @IBOutlet var sliderMove: UISlider!
    
    var foodVarieties:Dictionary<String,Array<String>>?
    var foodCategory:Array<String>?
    var selectedFood:String?
    var foodList:Array<String>?
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        guard (foodCategory != nil) && foodList != nil else
        {
            return 0
        }
        switch component
        {
        case 0: return foodCategory!.count
        case 1: return foodList!.count
        default: return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        guard (foodCategory != nil) && foodList != nil else
        {
            return "None"
        }
        switch component
        {
        case 0: return foodCategory![row]
        case 1: return foodList![row]
        default: return "None"
        }
    }
    
    @IBAction func sliderMoving(_ sender: UISlider)
    {
        let position = (Int)(sliderMove!.value + 0.5)
        sliderMove?.setValue(Float(position), animated: false)
        picker.selectRow(Int(position), inComponent: 1, animated: true)
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int,inComponent component: Int)
    {
        guard (foodCategory != nil) && foodList != nil else
        {
            return
        }
        if component == 0
        {
            selectedFood = foodCategory![row]
            foodList = foodVarieties![selectedFood!]!.sorted()
            pickerView.reloadComponent(1)
        }
        
        sliderMove.maximumValue =  Float((foodList?.count)!-1)
        sliderMove.minimumValue = 0
        sliderMove.setValue(Float(row), animated: true)

        
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        picker.dataSource = self
        picker.delegate = self
        
        let data:Bundle = Bundle.main
        let foodPlist:String? = data.path(forResource: "Food", ofType: "plist")
        if foodPlist != nil
        {
            foodVarieties = (NSDictionary.init(contentsOfFile: foodPlist!) as! Dictionary)
            foodCategory = foodVarieties?.keys.sorted()
            selectedFood = foodCategory![0]
            foodList = foodVarieties![selectedFood!]!.sorted()

        // Do any additional setup after loading the view.
        }
    }
}

