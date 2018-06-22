//
//  vsplayer.swift
//  iosproject
//
//  Created by Aaron Arcelio on 13/06/18.
//  Copyright © 2018 IOS. All rights reserved.
//

import UIKit
class vsplayer: UIViewController {
    @IBOutlet weak var p1passed: UILabel!
    @IBOutlet weak var p2passed: UILabel!
    @IBOutlet weak var p1hpdisplay: UILabel!
    @IBOutlet weak var p2hpdisplay: UILabel!
    @IBOutlet weak var p1skill: UIButton!
    @IBOutlet weak var p2skill: UIButton!
    @IBOutlet weak var p1atkturn: UIButton!
    @IBOutlet weak var p2atkturn: UIButton!
    var turn:Int=0
    var counter:Int=0
    override func viewDidLoad() {
        turn = Int(arc4random_uniform(2))
        super.viewDidLoad()
        p1passed.text = p1.nama
        p1hpdisplay.text = String(p1.hp)
        p2passed.text = p2.nama
        p2hpdisplay.text = String(p2.hp)
        switch2()
        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func p1atk(_ sender: Any) {
        p2.hp -= p1.atk
        p2hpdisplay.text = String(p2.hp)
        switch2()
    }
    @IBAction func p2atk(_ sender: Any) {
        p1.hp -= p2.atk
        p1hpdisplay.text = String(p1.hp)
        switch2()
    }
    @IBAction func p1skill_(_ sender: Any) {
        if(counter%2==0){
            p2.hp = p2.hp - ((p1.atk * (p1.critical / 100)) + p1.atk)
        }
        p1hpdisplay.text = String(p1.hp)
        switch2()
    }
    @IBAction func p2skill(_ sender: Any) {
        if(counter%2==0){
            p1.hp = p1.hp - ((p2.atk * (p2.critical / 100)) + p2.atk)
        }
        p2hpdisplay.text = String(p2.hp)
        switch2()
    }
    func switch2(){
        var info:String=""
        if(p1.hp<=0){
            info = p2.nama
        }
        else if(p2.hp<=0){
            info = p1.nama
        }
        print("0")
        if(info != ""){
            let alert = UIAlertController(title: "A winner has concluded", message: "\(info) wins!!", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Back to menu", style: .default, handler: { (al) in
                self.performSegue(withIdentifier: "mainmenu", sender: self)
            }))
            self.present(alert, animated: true, completion: nil)
        }
        print("a")
        if(turn==0){
            turn = 1
        }
        else{turn = 0}
        if(turn==0){
            p2atkturn.isEnabled=false
            p2skill.isEnabled=false
            p1atkturn.isEnabled=true
            p1skill.isEnabled=true
        }
        else{
            p1atkturn.isEnabled=false
            p1skill.isEnabled=false
            p2atkturn.isEnabled=true
            p2skill.isEnabled=true
        }
        print("b")
        if(counter%4==0){
            p1.hp += (p1.evade / 100 * p1.initialhp)
            p2.hp += (p2.evade / 100 * p2.initialhp)
        }
        counter += 1
        print("\(turn)")
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
