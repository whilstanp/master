//
//  setp2.swift
//  iosproject
//
//  Created by Aaron Arcelio on 13/06/18.
//  Copyright © 2018 IOS. All rights reserved.
//

import UIKit
class hero{
    var nama:String=""
    var atk:Float=0
    var def:Float=0
    var hp:Float=0
    var evade:Float=0
    var critical:Float=0
    var initialhp:Float=0
    init(_ n:String="", _ pa:Float=0, _ pd:Float=0, _ ph:Float=0, _ pe:Float=0, _ pc:Float=0) {
        nama = n
        atk = pa
        def = pd
        hp = ph
        evade = pe
        critical = pc
        initialhp = ph
    }
}

var p1:hero=hero()
var p2:hero=hero()

class setp2: UIViewController {
    @IBOutlet weak var p2name: UITextField!
    @IBOutlet weak var p2atk: UITextField!
    @IBOutlet weak var p2def: UITextField!
    @IBOutlet weak var p2evade: UITextField!
    @IBOutlet weak var p2critical: UITextField!
    @IBOutlet weak var p2hp: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func p2pass(_ sender: UIButton) {
p2=hero(p2name.text!,Float(p2atk.text!)!,Float(p2def.text!)!,Float(p2hp.text!)!,Float(p2evade.text!)!,Float(p2critical.text!)!)
        performSegue(withIdentifier: "passp2data", sender: self)
    }
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
