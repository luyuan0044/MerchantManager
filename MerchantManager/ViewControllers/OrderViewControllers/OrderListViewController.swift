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
    
    @IBOutlet weak var filterButton: UIBarButtonItem!
    
    @IBOutlet weak var filterPanelView: UIView!
    
    @IBOutlet weak var statusSegButton: UISegmentedControl!
    
    @IBOutlet weak var orderListTableView: UITableView!
    
    var refreshControl: UIRefreshControl!
    
    var orders: [[Order]] = []
    
    let orderCellIdentifier = "orderCell"
    
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
        
        orderListTableView.delegate = self
        orderListTableView.dataSource = self
        
        autoreleasepool(invoking: {
            refreshControl = UIRefreshControl()
        })
        orderListTableView.addSubview(refreshControl)
        refreshControl.addTarget(self, action: #selector(OrderListViewController.pullToRefresh(sender:)), for: .valueChanged)
        
        statusSegButton.tintColor = UIColor.white
        statusSegButton.addTarget(self, action: #selector(OrderListViewController.onSegButtonClicked(sender:)), for: .valueChanged)
        statusSegButton.setTitle(NSLocalizedString("all", comment: ""), forSegmentAt: 0)
        statusSegButton.setTitle(NSLocalizedString("pending", comment: ""), forSegmentAt: 1)
        statusSegButton.setTitle(NSLocalizedString("processing", comment: ""), forSegmentAt: 2)
        statusSegButton.setTitle(NSLocalizedString("completed", comment: ""), forSegmentAt: 3)
        statusSegButton.setTitle(NSLocalizedString("canceled", comment: ""), forSegmentAt: 4)
        statusSegButton.selectedSegmentIndex = OrderList.shareInstance.searchCondition.status
        
        loadData (withCachedClear: false)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if OrderList.shareInstance.isSearchConditionChanged() {
            loadData(withCachedClear: true)
        }
    }
    
    func styleNavBar() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = false
        
        self.navigationController?.navigationBar.barTintColor = appThemeColor
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white]
        
        menuButton.tintColor = UIColor.white
        menuButton.imageInsets = UIEdgeInsets (top: 5, left: 5, bottom: 5, right: 5)
        
        filterButton.tintColor = UIColor.white
        filterButton.imageInsets = UIEdgeInsets (top: 3, left: 3, bottom: 3, right: 3)
    }
    
    @IBAction func filterButtonAction(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "show_order_list_filters", sender: self)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: orderCellIdentifier)
        
        if cell == nil {
            cell = UITableViewCell (style: .default, reuseIdentifier: orderCellIdentifier)
        }
        
        let model = self.orders.first![indexPath.row]
        
        cell!.textLabel!.text = model.id
    
        return cell!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders[section].count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return orders.count
    }
    
    func onSegButtonClicked(sender: AnyObject) {
        let segButton = sender as! UISegmentedControl
        
        switch segButton.selectedSegmentIndex {
            case 0:
                OrderList.shareInstance.setSearchStatus(status: 0)
            case 1:
                OrderList.shareInstance.setSearchStatus(status: orderStatus.pending.rawValue)
            case 2:
                OrderList.shareInstance.setSearchStatus(status: orderStatus.processing.rawValue)
            case 3:
                OrderList.shareInstance.setSearchStatus(status: orderStatus.completed.rawValue)
            case 4:
                OrderList.shareInstance.setSearchStatus(status: orderStatus.canceled.rawValue)
            default:
                break
        }
        
        loadData(withCachedClear: true)
    }
    
    func pullToRefresh(sender: AnyObject) {
        loadData(withCachedClear: true)
    }
    
    func loadData (withCachedClear: Bool) {
        BasicLaodingView.shared.showProgressView(self.view)
        statusSegButton.isUserInteractionEnabled = false
        DispatchQueue.global().async {
            OrderList.shareInstance.LoadOrderList(withCachedClear: withCachedClear, completion: { orders in
                self.orders = orders.groupBy(groupClosure: {$0.createAt!})
                BasicLaodingView.shared.hideProgressView()
                self.statusSegButton.isUserInteractionEnabled = true
                self.RefreshData()
            })
        }
    }
    
    private func RefreshData() {
        self.orderListTableView.reloadData()
        self.orderListTableView.layoutIfNeeded()
    }
}
