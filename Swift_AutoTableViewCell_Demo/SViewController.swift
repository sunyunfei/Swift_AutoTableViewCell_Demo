//
//  SViewController.swift
//  Swift_AutoTableViewCell_Demo
//
//  Created by 孙云飞 on 2018/8/27.
//  Copyright © 2018年 孙云飞. All rights reserved.
//

import UIKit

class SViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var datas:Array<TestModel>?
    var currentCell:UITableViewCell?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let t = TestModel()
        
        datas = t.loadData()
        
        tableView.register(UINib.init(nibName: tCell, bundle: nil), forCellReuseIdentifier: tCell)
        
        currentCell = tableView.dequeueReusableCell(withIdentifier: tCell)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return (datas?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:TestCell = tableView.dequeueReusableCell(withIdentifier: tCell, for: indexPath) as! TestCell
        cell.model = datas?[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let model:TestModel = datas![indexPath.row]
        if let h = model.height {
            
            if h > 0.0{
                print("已经缓存高度")
                return CGFloat.init(model.height!)
            }
            
        }
        
        let cell:TestCell = currentCell as! TestCell
        cell.contentView.translatesAutoresizingMaskIntoConstraints = false
        cell.model = datas?[indexPath.row]
        
        let top:NSLayoutConstraint = NSLayoutConstraint.init(item: cell.contentView, attribute: .top, relatedBy: .equal, toItem: cell, attribute: .top, multiplier: 1.0, constant: 0)
        let bottom:NSLayoutConstraint = NSLayoutConstraint.init(item: cell.contentView, attribute: .bottom, relatedBy: .equal, toItem: cell, attribute: .bottom, multiplier: 1.0, constant: 0)
        let right:NSLayoutConstraint = NSLayoutConstraint.init(item: cell.contentView, attribute: .right, relatedBy: .equal, toItem: cell, attribute: .right, multiplier: 1.0, constant: 0)
        let left:NSLayoutConstraint = NSLayoutConstraint.init(item: cell.contentView, attribute: .left, relatedBy: .equal, toItem: cell, attribute: .left, multiplier: 1.0, constant: 0)
        
        cell.addConstraints([top,bottom,right,left])
        
        let w = self.tableView.frame.size.width
        let tt:NSLayoutConstraint = NSLayoutConstraint.init(item: cell.contentView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: w)
        
        cell.contentView.addConstraint(tt)
        
        
        let height = cell.contentView.systemLayoutSizeFitting(UILayoutFittingCompressedSize).height + 2 * 1 / UIScreen.main.scale + 8 + 8
        
        model.height = Double.init(height)
        return height
    }

}
