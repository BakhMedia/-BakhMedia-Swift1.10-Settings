//
//  ViewController.swift
//  IfSwitchCase
//
//  Created by Ilya Aleshin on 29.05.2018.
//  Copyright © 2018 Bakh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var themes = ["Все", "Swift", "Android", "Сервер"]
    
    @IBOutlet weak var themesPicker: UIPickerView!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var notificationSwitch: UISwitch!
    @IBOutlet weak var countPerPage: UISlider!
    @IBOutlet weak var countPerPageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let theme = UserDefaults.standard.string(forKey: "favoriteTheme") ?? ""
        let i = self.themes.firstIndex(of: theme) ?? 0
        self.themesPicker.selectRow(i, inComponent: 0, animated: true)
        self.nameField.text = UserDefaults.standard.string(forKey: "chatNameField")
        let c: Int = UserDefaults.standard.integer(forKey: "countPerPage") 
        self.countPerPage.setValue(Float(c), animated: true)
        self.countPerPageLabel.text = c.description
        let n: Bool = UserDefaults.standard.bool(forKey: "notificateMe") 
        self.notificationSwitch.setOn(n, animated: true)
    }
    
    @IBAction func nameEditEnd(_ sender: Any) {
        UserDefaults.standard.set(self.nameField.text, forKey: "chatNameField")
    }
    
    @IBAction func notificationChanged(_ sender: Any) {
        UserDefaults.standard.set(self.notificationSwitch.isOn, forKey: "notificateMe")
        self.view.endEditing(true)
    }
    
    @IBAction func countPerPageChanged(_ sender: Any) {
        let c: Int = Int(self.countPerPage.value)
        UserDefaults.standard.set(c, forKey: "countPerPage")
        self.countPerPageLabel.text = c.description
        self.view.endEditing(true)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.themes.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.themes[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        UserDefaults.standard.set(self.themes[row], forKey: "favoriteTheme")
        self.view.endEditing(true)
    }
    
}

