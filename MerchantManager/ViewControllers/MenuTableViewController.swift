//
//  MenuTableViewController.swift
//  MerchantManager
//
//  Created by Yuan Lu on 2017-05-09.
//  Copyright © 2017 richard. All rights reserved.
//

import UIKit

class MenuTableViewController: UITableViewController {
    
    typealias RowValue = (imagePath:String, title:String, segue:String?)
    
    let menuItems:[RowValue] =
        [("icon_user_filled.png", "User Name", nil),
        ("icon_dashboard_filled.png", NSLocalizedString("dashboard", comment: ""), "show_dashboard"),
        ("icon_order_filled.png", NSLocalizedString("orders", comment: ""), "show_order_list"),
        ("icon_category_filled.png", NSLocalizedString("categories", comment: ""), "show_category_list"),
        ("icon_product_filled.png", NSLocalizedString("products", comment: ""), nil),
        ("icon_store_filled.png", NSLocalizedString("store", comment: ""), nil),
        ("icon_setting_filled.png", NSLocalizedString("settings", comment: ""), nil)]

    let cellIdentifier = "menuCell"
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.clearsSelectionOnViewWillAppear = false
        self.tableView.backgroundColor = appThemeColor
        self.tableView.separatorStyle = .none
        self.tableView.isScrollEnabled = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return menuItems.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        
        if (cell == nil) {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: cellIdentifier)
        }
        
        let rowValue = menuItems[indexPath.row]
        
        cell?.imageView?.image = UIImage.init(named: rowValue.imagePath)?.withRenderingMode(.alwaysTemplate)
        cell?.imageView?.tintColor = UIColor.white
        
        cell?.textLabel?.text = rowValue.title
        cell?.textLabel?.textColor = UIColor.white
        
        cell?.backgroundColor = appThemeColor
        
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (indexPath.row == 0){
            return menuTableViewHeaderRowHeight
        }
        else
        {
            return menuTableViewNormalRowHeight
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.contentView.backgroundColor = menuTableViewSelectedCellBackgroundColor
        cell?.backgroundColor = menuTableViewSelectedCellBackgroundColor
        
        if let segue = menuItems[indexPath.row].segue {
            performSegue(withIdentifier: segue, sender: nil)
        }
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.contentView.backgroundColor = appThemeColor
        cell?.backgroundColor = appThemeColor
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
