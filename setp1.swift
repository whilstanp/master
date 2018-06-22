//
//  setp1.swift
//  iosproject
//
//  Created by Aaron Arcelio on 13/06/18.
//  Copyright © 2018 IOS. All rights reserved.
//

import UIKit
import Foundation
class setp1: UIViewController,UITextViewDelegate {
    var nama:String = ""
    @IBOutlet weak var p1name: UITextField!
    @IBOutlet weak var p1atk: UITextField!
    @IBOutlet weak var p1def: UITextField!
    @IBOutlet weak var p1evade: UITextField!
    @IBOutlet weak var p1critical: UITextField!
    @IBOutlet weak var p1hp: UITextField!
    @IBAction func p1pass(_ sender: UIButton) {
p1=hero(p1name.text!,Float(p1atk.text!)!,Float(p1def.text!)!,Float(p1hp.text!)!,Float(p1evade.text!)!,Float(p1critical.text!)!)
        performSegue(withIdentifier: "passp1data", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        return textField.resignFirstResponder()
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
