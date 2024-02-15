//
//  PokeItemDetailViewController.swift
//  TableViewPratice-1
//
//  Created by Howe on 2024/2/14.
//

import UIKit

class PokeItemDetailViewController: UIViewController {
    
    var item: Item?
    
    @IBOutlet weak var itemName: UILabel?
    
    @IBOutlet weak var itemImageView: UIImageView?
    
    @IBOutlet weak var itemDescription: UITextView?
    
    @IBOutlet weak var otherLangurage: UITextView?
    
    static var reuseIdentifier: String { "\(Self.self)" }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        update(item: item!)
        // Do any additional setup after loading the view.
    }
    
    func update(item: Item) {
        
        itemName?.text = item.name
        itemImageView?.image = UIImage(named: item.name)
        itemDescription?.text = item.description
        otherLangurage?.text = item.otherLangurage
        
    }

}
