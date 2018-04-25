//
//  ItemDetailViewController.swift
//  NavigationTest
//
//  Created by MF839-032 on 25/04/2018.
//  Copyright © 2018 MF839-032. All rights reserved.
//

import UIKit

class ItemDetailViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var itemImage: UIImageView!
    
    var item: UsedItem?
    var users = createUserSample()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        

    }
    override func viewWillAppear(_ animated: Bool) {
        if let item = item {
            titleLabel.text = item.title!
            priceLabel.text = "$\(item.price!)"
            userLabel.text = "\(users[item.userId!]!.name!)"
        }
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
