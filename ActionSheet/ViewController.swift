//
//  ViewController.swift
//  ActionSheet
//
//  Created by Ammy Pandey on 18/07/17.
//  Copyright © 2017 Ammy Pandey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var x_text: UITextField!
    @IBOutlet weak var y_text: UITextField!
    @IBOutlet weak var height_text: UITextField!
    @IBOutlet weak var width_text: UITextField!
    
    
    // Declear type of object to add
    
    var objectToAdd: UIView!
    
    //first load func
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func addObject(){
        
        // if some of text field is empty the placeholder of textfield is red
        
        if (x_text.text?.isEmpty)! || (y_text.text?.isEmpty)! || (width_text.text?.isEmpty)! || (height_text.text?.isEmpty)! {
            
            //red placeholder for textfields
            x_text.attributedPlaceholder = NSAttributedString(string: x_text.placeholder!, attributes: [NSForegroundColorAttributeName: UIColor.red])
            y_text.attributedPlaceholder = NSAttributedString(string: y_text.placeholder!, attributes: [NSForegroundColorAttributeName: UIColor.red])
            width_text.attributedPlaceholder = NSAttributedString(string: width_text.placeholder!, attributes: [NSForegroundColorAttributeName: UIColor.red])
            height_text.attributedPlaceholder = NSAttributedString(string: height_text.placeholder!, attributes: [NSForegroundColorAttributeName: UIColor.red])
            
            return
        }else {
            
            //Shortcuts frame of object
            let X = CGFloat(Int(x_text.text!)!)
            let Y = CGFloat(Int(y_text.text!)!)
            let width = CGFloat(Int(width_text.text!)!)
            let height = CGFloat(Int(height_text.text!)!)
            
            objectToAdd = UIView()
            objectToAdd.frame = CGRect(x: X, y: Y, width: width, height: height)
            objectToAdd.layer.zPosition = -1
            objectToAdd.backgroundColor = UIColor.red
            objectToAdd.tag = 1
            self.view.addSubview(objectToAdd)
            
            //textfield to be empty after adding object
            x_text.text = ""
            y_text.text = ""
            width_text.text = ""
            height_text.text = ""
            
            //dismising the keyboard
            self.view.endEditing(true)
            
        }
    }
    
    func deleteObject(){
        
        //taking each view of view controller into *view
        for view in self.view.subviews{
            
            //all view that have tag = 1
            if view.tag == 1 {
                view.removeFromSuperview()
            }
        }
        
    }
    

    // called when actionSheet button pressed
    @IBAction func actionSheet_clicked(_ sender: Any) {
        
        // declared constant sheet to store actionSheet
        let sheet = UIAlertController(title: "Hello ActionSheet", message: "This is my first actionSheet", preferredStyle: UIAlertControllerStyle.actionSheet)
        
        // declared add button
        let add = UIAlertAction(title: "Add Object", style: .default) { (action: UIAlertAction) in
            self.addObject()
        }
        
        //declared delete button
        let delete = UIAlertAction(title: "Delete Object", style: .destructive) { (action: UIAlertAction) in
            self.deleteObject()
        }
        
        //declared cancel button
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        // add buttons to ActionSheet
        sheet.addAction(add)
        sheet.addAction(delete)
        sheet.addAction(cancel)
        
        //Show ActionSheet
        self.present(sheet, animated: true, completion: nil)
    }
   
    

}

