//
//  HomeViewController.swift
//  IOScollegeApp
//
//  Created by HT-Mac-06 on 4/10/24.
//

import UIKit

class HomeViewController: UIViewController , UITableViewDelegate , UITableViewDataSource{
    
    
    @IBOutlet weak var HomeTableview: UITableView!

    var db:DB_Manager = DB_Manager()
    var users:[User] = []

   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        HomeTableview.delegate = self
        HomeTableview.dataSource = self
        
        //for long tap gesture
        let longPressed:UILongPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(self.handleLongPressed(_:)))
            HomeTableview.addGestureRecognizer(longPressed)

      
       

       
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
          super.viewDidAppear(animated)
                    users = db.read()
              self.TableViewanimation()
      }
    
    //transition of tablevieww cells
    func TableViewanimation() {
        HomeTableview.reloadData()
           
        let cells = HomeTableview.visibleCells
        let tableViewHeight = HomeTableview.bounds.size.height
        
        for cell in cells {
            cell.transform = CGAffineTransform(translationX: 0, y: -tableViewHeight - 30)
        }
        
        var delayCounter = 0
        
        for cell in cells {
            UIView.animate(withDuration: 1.0, delay: Double(delayCounter) * 0.10, options: .transitionFlipFromTop, animations: {
                cell.transform = CGAffineTransform.identity
            }, completion: nil)
            
            delayCounter += 1
        }
    }


   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell",for: indexPath) as! HomeTableViewCell
        
        cell.HomeEmailLbl.text = ("E-Mail: \(users[indexPath.row].email)")
        cell.HomePhoneLbl.text = ("Phone: \(users[indexPath.row].phone)")
        cell.selectionStyle = .none

        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    //longpressed gesture
    @objc func handleLongPressed(_ sender: UILongPressGestureRecognizer){
        
        if sender.state == .began {
                let touchPoint = sender.location(in: HomeTableview)
                if let indexPath = HomeTableview.indexPathForRow(at: touchPoint) {
                    
                    let email = users[indexPath.row].email
                    let alert = UIAlertController(title: "\(email)", message: "", preferredStyle: .alert)
                    let Heyback = UIAlertAction(title: "Ok", style: .default)

                    present(alert,animated: true , completion:  nil)
                    alert.addAction(Heyback)

                }
            }
        print("Long press is detected")
        
    }
    
   
    



}
