//
//  CategoryTableViewController.swift
//  MerchantManager
//
//  Created by Richard Lu on 2017-05-19.
//  Copyright © 2017 richard. All rights reserved.
//

import UIKit

class CategoryTableViewController: UITableViewController {
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    let categoryCellIdentifier = "categoryCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.isEditing = true
        tableView.allowsSelectionDuringEditing = true
        
        self.title = NSLocalizedString("categories", comment: "")
        
        styleNavBar()
        
        //setup left menu button
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return CategoryList.shared.getCategoriesOnView().count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: categoryCellIdentifier)
        
        if cell == nil {
            cell = UITableViewCell (style: .default, reuseIdentifier: categoryCellIdentifier)
        }

        var cellModel = CategoryList.shared.getCategoriesOnView()[indexPath.row]
        
        cell!.textLabel!.text = cellModel.0.name!["en"]

        return cell!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cellModel = CategoryList.shared.getCategoriesOnView()[indexPath.row]
        
        if (!cellModel.1) { //not extended
            tableView.beginUpdates()
            let numberOfChildren = CategoryList.shared.extend(index: indexPath.row)
            
            if numberOfChildren == 0 { return }
            
            var indexPathToInsert: [IndexPath] = []
            for index in 1...numberOfChildren {
                indexPathToInsert.append(IndexPath.init(row: indexPath.row + index, section: indexPath.section))
            }
            
            tableView.insertRows(at: indexPathToInsert, with: .top)
            tableView.endUpdates()
        } else {    //has alreday extended
            tableView.beginUpdates()
            let numberCellToRemove = CategoryList.shared.collapse(index: indexPath.row)
            
            if numberCellToRemove == 0 { return }
            
            var indexPathToRemove: [IndexPath] = []
            for index in 1...numberCellToRemove {
                indexPathToRemove.append(IndexPath.init(row: indexPath.row + index, section: indexPath.section))
            }
            
            tableView.deleteRows(at: indexPathToRemove, with: .top)
            tableView.endUpdates()
        }
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

    
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        tableView.beginUpdates()
        CategoryList.shared.move(fromIndex: fromIndexPath.row, toIndex: to.row)
        tableView.moveRow(at: fromIndexPath, to: to)
        tableView.endUpdates()
    }

    
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        let cellModel = CategoryList.shared.getCategoriesOnView()[indexPath.row]
        return !cellModel.1
    }
    
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return UITableViewCellEditingStyle.none
    }
    
    
    override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    
    override func tableView(_ tableView: UITableView, targetIndexPathForMoveFromRowAt sourceIndexPath: IndexPath, toProposedIndexPath proposedDestinationIndexPath: IndexPath) -> IndexPath {
        
        return IndexPath(row: 0, section: 0)
    }
    
    
    override func tableView(_ tableView: UITableView, indentationLevelForRowAt indexPath: IndexPath) -> Int {
        return (CategoryList.shared.getCategoriesOnView()[indexPath.row].0.level - 2) * 2
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    // Mark: - Implementation
    
    func styleNavBar() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = false
        
        self.navigationController?.navigationBar.barTintColor = appThemeColor
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white]
        
        menuButton.tintColor = UIColor.white
        menuButton.imageInsets = UIEdgeInsets (top: 5, left: 5, bottom: 5, right: 5)
    }

}
