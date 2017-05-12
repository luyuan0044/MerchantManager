//
//  OrderListViewController.swift
//  MerchantManager
//
//  Created by Yuan Lu on 2017-05-10.
//  Copyright © 2017 richard. All rights reserved.
//

import UIKit

class OrderListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    @IBOutlet weak var filterPanelView: UIView!
    
    @IBOutlet weak var statusSegButton: UISegmentedControl!
    
    @IBOutlet weak var orderListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = NSLocalizedString("orders", comment: "")

        styleNavBar()
        
        //setup left menu button
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        filterPanelView.backgroundColor = appThemeColor
        
        statusSegButton.tintColor = UIColor.white
        
        orderListTableView.delegate = self
        orderListTableView.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func styleNavBar() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = false
        
        self.navigationController?.navigationBar.barTintColor = appThemeColor
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white]
        
        menuButton.tintColor = UIColor.white
        menuButton.imageInsets = UIEdgeInsets (top: 5, left: 5, bottom: 5, right: 5)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}
