//
//  PokeItemTableViewController.swift
//  TableViewPratice-1
//
//  Created by Howe on 2024/2/14.
//

import UIKit

// 定義一個繼承自 UITableViewController 的類別，用於顯示和管理一個表格視圖中的寶可夢物品
class PokeItemTableViewController: UITableViewController {
    
    // 宣告一個變數來存儲寶可夢物品的陣列
    var items = PokemonItem.pokemonItems
    
    // 當視圖控制器的視圖載入完成後調用
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 設置當視圖即將顯示時，是否清除選中的行
        self.clearsSelectionOnViewWillAppear = false
        
        // 設置導航欄右側的編輯按鈕
        self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    
    
    // MARK: - Table view data source
    
    // 返回表格視圖中的區段數量，這裡是根據物品陣列的數量決定
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return items.count
    }
    
    // 返回每個區段中的行數，這裡是根據該區段物品的數量決定
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return items[section].item.count
    }
    
    // 設置每個單元格的內容
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // 根據區段和行索引找到對應的物品
        let item = items[indexPath.section].item[indexPath.row]
        
        // 根據區段索引來決定單元格的類型
        if indexPath.section == 0 {
            // if indexPath.section.description == "Ball" {
            
            // 如果是第一個區段，則使用「球」類別的單元格
            guard let ballCell = tableView.dequeueReusableCell(withIdentifier: categoryBallTableViewCell.reuseIdentifier, for: indexPath) as? categoryBallTableViewCell else { fatalError("dequeueReusable failed") }
            
            // ballCell.itemNameLabel.text = item.name
            // ballCell.itemImageView.image = UIImage(named: item.imageName)
            
            // 更新單元格內容
            ballCell.update(item: item)
            // 有分 section 的話就需要增加它的 id
            ballCell.detailButton.sectionID = items[indexPath.section].id
            // 設置委託
            ballCell.delegate = self
            
            return ballCell
            
        } else {
            // 如果不是第一個區段，則使用「藥品」類別的單元格
            guard let medicineCell = tableView.dequeueReusableCell(withIdentifier: categoryMedicineTableViewCell.reuseIdentifier, for: indexPath) as? categoryMedicineTableViewCell else { fatalError("dequeueReusable failed") }
            
            // medicineCell.itemNameLabel.text = item.name
            // medicineCell.itemImageView.image = UIImage(named: item.imageName)
            
            // 更新單元格內容
            medicineCell.update(item: item)
            
            return medicineCell
        }
    }
    
    // 設置每個區段的標題
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return items[section].category
    }
    
    // 設置表格視圖是否允許編輯
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // 處理單元格的刪除和插入操作
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // 如果是刪除操作，則從數據源中刪除該行對應的物品
            items[indexPath.section].item.remove(at: indexPath.row)
            // 更新表格視圖
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
        } else if editingStyle == .insert {
            // 如果是插入操作，這裡沒有具體實現
        }
    }
    
    // 處理單元格的移動操作，這裡沒有具體實現
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        
        let fromElement = items[fromIndexPath.section].item[fromIndexPath.row]
        let toElement = items[to.section].item[to.row]
        
        items[to.section].item[to.row] = fromElement
        items[fromIndexPath.section].item[fromIndexPath.row] = toElement
        tableView.reloadData()
        
    }
    
    // 設置表格視圖是否允許移動單元格
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    
    // MARK: - 傳輸資料的各種手段
    
    // 為segue準備數據的方法，當觸發segue轉場時調用
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // 檢查segue的標識符是否為"showWithPrepare"
        if segue.identifier == "showWithPrepare" {
            
            // 嘗試獲取目標視圖控制器和當前選中的表格行
            if let controller = segue.destination as? PokeItemDetailViewController,
               let indexPath = tableView.indexPathForSelectedRow {
                
                // 將選中的物品傳遞給詳情視圖控制器
                controller.item = items[indexPath.section].item[indexPath.row]
            }
        }
    }
    
    
    
    // 通過按鈕觸發的動作，用於顯示詳情視圖控制器
    @IBAction func show(_ sender: UIButton) {
        
        // 將按鈕的位置轉換為在表格視圖中的位置
        let point:CGPoint = sender.convert(.zero, to: tableView)
        
        // 根據位置獲取對應的indexPath
        if let indexPath = tableView.indexPathForRow(at: point) {
            
            // 獲取選中的物品
            let selectItem = items[indexPath.section].item[indexPath.row]
            
            // 通過Storyboard實例化詳情視圖控制器
            let detailController = storyboard?.instantiateViewController(withIdentifier: PokeItemDetailViewController.reuseIdentifier) as! PokeItemDetailViewController
            
            // 設置詳情視圖控制器的物品
            detailController.item = selectItem
            
            // 將詳情視圖控制器推送到導航控制器上
            navigationController?.pushViewController(detailController, animated: true)
        }
    }
    
    
    
    // 使用IBSegueAction自定義Segue的初始化，使得可以在使用Storyboard Segue時進行更多的自定義設置
    @IBSegueAction func showWithSegue(_ coder: NSCoder) -> PokeItemDetailViewController? {
        
        // 獲取當前選中的表格行
        guard let indexPath = tableView.indexPathForSelectedRow else { return nil }
        let selectItem = items[indexPath.section].item[indexPath.row]
        
        // 用編碼器和選中的物品初始化詳情視圖控制器
        let controller = PokeItemDetailViewController(coder: coder)
        controller?.item = selectItem
        //controller?.update(item: selectItem)
        
        return controller
    }
    
    
    
    // 處理表格視圖行選中事件的方法
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // 獲取選中的物品
        let selectItem = items[indexPath.section].item[indexPath.row]
        // 實例化詳情視圖控制器
        let controller = PokeItemDetailViewController()
        
        // 設置詳情視圖控制器的物品
        controller.item = selectItem
        
        // 以模態方式呈現詳情視圖控制器
        present(controller, animated: true)
    }
    
    
    
}



// MARK: - extension

// 擴展PokeItemTableViewController以實現categoryBallTableViewCellDelegate協議
extension PokeItemTableViewController: categoryBallTableViewCellDelegate {
    
    // 當categoryBallTableViewCell中的詳情按鈕被點擊時調用
    func detailButtonTap(sender: DetailButton) {
        
        // 嘗試從按鈕獲取所在的區段ID
        guard let sectionID = sender.sectionID else { return }
        
        // 使用區段ID找到對應的區段索引
        let section = items.indexOfElement(with: sectionID)
        
        // 嘗試從按鈕獲取所在的行ID
        guard let rowID = sender.rowID else { return }
        
        // 使用行ID找到對應的行索引
        let row = items[section].item.indexOfElement(with: rowID)
        
        // 根據區段索引和行索引獲取選中的物品
        let selectItem = items[section].item[row]
        // 輸出選中物品的名稱，這行主要用於調試
        print(selectItem.name)
        
        // 從Storyboard實例化詳情視圖控制器
        let controller = storyboard?.instantiateViewController(withIdentifier: PokeItemDetailViewController.reuseIdentifier) as! PokeItemDetailViewController
        
        // 設置詳情視圖控制器的物品
        controller.item = selectItem
        // 以模態方式呈現詳情視圖控制器
        present(controller, animated: true)
        // 或者將詳情視圖控制器推送到導航控制器上，根據具體需求選擇使用
        // navigationController?.pushViewController(controller, animated: true)
    }
}
