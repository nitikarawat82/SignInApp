//
//  ProfileViewController.swift
//  IOScollegeApp
//
//  Created by HT-Mac-06 on 4/10/24.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var SignOutlet: UIButton!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var phoneLbl: UILabel!
    
    var db:DB_Manager = DB_Manager()
    var Users:[User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       Users = db.read()
        SignOutlet.layer.borderWidth = 1
        SignOutlet.layer.borderColor = UIColor.purple.cgColor
        
        emailLbl.text = Users.last?.email ?? ""
        phoneLbl.text = Users.last?.phone ?? ""
    }
    

    @IBAction func SignOutAction(_ sender: Any) {
        

        
        let alert = UIAlertController(title: "Are you really want to Sign Out ?", message: "", preferredStyle: .alert)
        
        
        //alert on clicking No
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
            print("Handle Cancel Logic here")
        }))

        //alert on clicking YES
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in

            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let signupvc = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
            self.navigationController?.popViewController(animated: true)

        }))

        present(alert,animated: true , completion:  nil)
        
        

        
        
    }
    

}
