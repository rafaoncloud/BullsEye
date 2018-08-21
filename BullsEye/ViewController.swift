//
//  ViewController.swift
//  BullsEye
//
//  Created by Rafael Henriques on 21/08/2018.
//  Copyright © 2018 rafaoncloud. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showAlert(){
        
        //Create Alert Dialog/Controller
        let alert = UIAlertController(title: "Hello World", message: "UIAlertController", preferredStyle: .alert)
        
        //Create Action button to Alert Dialog/Controller
        let action = UIAlertAction(title: "UIAlertAction", style: .default, handler: nil)
        
        //Add the Action Button to the Alert Dialog
        alert.addAction(action)
        
        //Add the Alert Dialog to be present in the UIViewController 
        present(alert,animated: true, completion: nil)
        
    }
}

