//
//  PokeItemTableViewController.swift
//  TableViewPratice-1
//
//  Created by Howe on 2024/2/14.
//

import UIKit

class PokeItemTableViewController: UITableViewController {
    
    var items = PokemonItem.pokemonItems
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        //         self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        //         self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return items.count
        
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return items[section].item.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let category = items[indexPath.section]
        let item = category.item[indexPath.row]
        
        // 假設第一個section使用ballCell，其他section使用medicineCell
        if indexPath.section == 0 {
            
            guard let ballCell = tableView.dequeueReusableCell(withIdentifier: categoryBallTableViewCell.reuseIdentifier, for: indexPath) as? categoryBallTableViewCell else { fatalError("dequeueReusable failed") }
            
            //            ballCell.itemNameLabel.text = item.name
            //            ballCell.itemImageView.image = UIImage(named: item.imageName)
            ballCell.update(item: item)
            return ballCell
        } else {
            
            guard let medicineCell = tableView.dequeueReusableCell(withIdentifier: categoryMedicineTableViewCell.reuseIdentifier, for: indexPath) as? categoryMedicineTableViewCell else { fatalError("dequeueReusable failed") }
            
            //            medicineCell.itemNameLabel.text = item.name
            //            medicineCell.itemImageView.image = UIImage(named: item.imageName)
            medicineCell.update(item: item)
            return medicineCell
        }
    }
    
    
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        items[section].category
        
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
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    
    
    @IBAction func show(_ sender: UIButton) {
        
        let point:CGPoint = sender.convert(.zero, to: tableView)
        
        if let indexPath = tableView.indexPathForRow(at: point) {
            let category = items[indexPath.section]
            let item = category.item[indexPath.row]
            
            let detailController = storyboard?.instantiateViewController(withIdentifier: "PokeItemDetailViewController") as! PokeItemDetailViewController
            print(item.description)
            
            detailController.item = item
            
            navigationController?.pushViewController(detailController, animated: true)
        }
        
    }
    
    
    
}
