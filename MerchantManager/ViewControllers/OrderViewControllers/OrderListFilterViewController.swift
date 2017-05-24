//
//  OrderListFilterViewController.swift
//  MerchantManager
//
//  Created by Richard Lu on 2017-05-23.
//  Copyright © 2017 richard. All rights reserved.
//

import UIKit

let datePickerTag           = 99 // view tag identifiying the date picker view

let titleKey = "title" // key for obtaining the data source item's title
let dateKey  = "date"  // key for obtaining the data source item's date value

let dateStartRow = 0
let dateEndRow   = 1

let dateCellID   = "dateCell"   // the cells with the start or end date
let datePickerID = "datePicker" // the cell containing the date picker

class OrderListFilterViewController: UITableViewController {
    
    var dataArray = [[String: AnyObject]]()
    
    // keep track which indexPath points to the cell with UIDatePicker
    var datePickerIndexPath: NSIndexPath?
    
    lazy var pickerCellRowHeight: CGFloat = {
        [unowned self] in
        
        // obtain the picker view cell's height, works because the cell was pre-defined in our storyboard
        let pickerViewCellToCheck = self.tableView.dequeueReusableCell(withIdentifier: datePickerID)
        
        return pickerViewCellToCheck!.frame.height
        }()
    
    var searchCondition = OrderList.shareInstance.searchCondition
    
    override func viewDidLoad() {
        super.viewDidLoad()

        styleNavBar()
        
        let item: [String : AnyObject] = [titleKey: "Start Date" as AnyObject, dateKey: NSDate()]
        
        self.dataArray = [item]
    }
    
    func styleNavBar() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = false
        
        self.navigationController?.navigationBar.barTintColor = appThemeColor
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white]
    }
    
    @IBAction func dismissViewController (_ sender: Any) {
        dismiss(animated: true, completion: {})
    }
    
    @IBAction func setupSearchCondition (_ sender: Any) {
        OrderList.shareInstance.searchCondition = searchCondition
        dismiss(animated: true, completion: {})
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func hasPickerForIndexPath(indexPath: NSIndexPath) -> Bool {
        var hasDatePicker = false
        
        var targetedRow = indexPath.row
        targetedRow += 1
        
        let checkDatePickerCell = self.tableView.cellForRow(at: IndexPath (row: targetedRow, section: 0))
        let checkDatePicker = checkDatePickerCell?.viewWithTag(datePickerTag)
        
        hasDatePicker = checkDatePicker != nil
        return hasDatePicker
    }
    
    func updateDatePicker() {
        if (self.datePickerIndexPath != nil) {
            let associatedDatePickerCell = self.tableView.cellForRow(at: self.datePickerIndexPath! as IndexPath)
            let targetedDatePicker = associatedDatePickerCell?.viewWithTag(datePickerTag) as? UIDatePicker
            
            if (targetedDatePicker != nil) {
                // we found a UIDatePicker in this cell, so update it's date value
                //
                let itemData = self.dataArray[self.datePickerIndexPath!.row - 1]
                targetedDatePicker!.setDate((itemData[dateKey] as! NSDate) as Date, animated: false)
            }
        }
    }
    
    func hasInlineDatePicker() -> Bool {
        return self.datePickerIndexPath != nil
    }
    
    func indexPathHasPicker(indexPath: NSIndexPath) -> Bool {
        return self.hasInlineDatePicker() && self.datePickerIndexPath!.row == indexPath.row
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    
    func indexPathHasDate(indexPath: NSIndexPath)-> Bool {
        var hasDate = false
        
        if ((indexPath.row == dateStartRow) ||
            (indexPath.row == dateEndRow || (self.hasInlineDatePicker() && (indexPath.row == dateEndRow + 1))))
        {
            hasDate = true
        }
        
        return hasDate
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return self.indexPathHasPicker(indexPath: indexPath as NSIndexPath) ? self.pickerCellRowHeight : self.tableView.rowHeight
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
