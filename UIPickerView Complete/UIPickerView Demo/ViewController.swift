//
//  ViewController.swift
//  UIPickerView Demo
//
//  Created by Duc Tran on 5/5/15.
//  Copyright (c) 2015 Duc Tran. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate
{
    
    var pickerView : UIPickerView!
    
    var currentDataSource = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        pickerView = UIPickerView()
        pickerView.center = view.center
        view.addSubview(pickerView)
        
        pickerView.dataSource = self
        pickerView.delegate = self
    }
    
    // MARK: - UIPickerViewDataSource
    
    // returns the number of 'columns' to display.
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int
    {
        if pickerView == self.pickerView {
            return 1
        }
        return 0
    }
    
    // returns the # of rows in each component..
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        if pickerView == self.pickerView {
            return currentDataSource.count
        }
        return 0
    }

    // MARK: - UIPickerViewDelegate
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String!
    {
        return "\(currentDataSource[row])"
    }
    
    // MARK: - Target/Action
    
    @IBAction func pickAValue(sender: AnyObject)
    {
        let selectedRow = pickerView.selectedRowInComponent(0)
        println(currentDataSource[selectedRow])
    }
    
    var newDataSource = [10, 11, 12, 13, 14, 15, 16, 17, 18, 19]
    
    @IBAction func changeDataSource(sender: AnyObject)
    {
        currentDataSource = newDataSource
//        pickerView.reloadComponent(0)
        pickerView.reloadAllComponents()
    }
}
















