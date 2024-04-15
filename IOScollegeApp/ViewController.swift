//
//  ViewController.swift
//  IOScollegeApp
//
//  Created by HT-Mac-06 on 4/10/24.
// rawatnitika343@gmail.com

import UIKit


class ViewController: UIViewController {

    var db:DB_Manager = DB_Manager()
   

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var phoneTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func clearDBBtnAction(_ sender: Any) {
        db.clearTable()
    }


    @IBAction func SubmitBtnAction(_ sender: Any) {
        
        
        guard let email = emailTextfield.text, !email.isEmpty else {
            showAlert(title: "Invalid Input", message: "Please enter a valid email address.")
            return
        }

        if isValidEmail(email) {
            guard let phone = phoneTextfield.text else {
                return
            }

            if isValidPhoneNumber(phone) {
                
                db.insert(id: 0, email: email, phone: phone)
                
                let tabVc = storyboard?.instantiateViewController(withIdentifier: "TabbarViewController") as! TabbarViewController
                navigationController?.pushViewController(tabVc, animated: true)
                phoneTextfield.text = ""
                emailTextfield.text = ""
            } else {
                showAlert(title: "Invalid Input", message: "Please enter a valid Phone number.")
            }
        }
        else
        {
            showAlert(title: "Invalid Input", message: "Please enter a valid email address.")
        }
       
        
        
        
    }
    
    
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }

    // Function to show alert messages
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func isValidPhoneNumber(_ phoneNumber: String) -> Bool {
        // Adjust regex to allow 8 to 15 digits for the phone number part
        let phoneRegex = "^(\\+\\d{1,3}[- ]?)?\\d{8,15}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        return phoneTest.evaluate(with: phoneNumber)
    }


}



