//
//  ViewController.swift
//  Swift_AutoTableViewCell_Demo
//
//  Created by 孙云飞 on 2018/8/27.
//  Copyright © 2018年 孙云飞. All rights reserved.
//

import UIKit

let tCell = "TestCell"
class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var datas:Array<TestModel>?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let t = TestModel()
        
        datas = t.loadData()
        
        tableView.register(UINib.init(nibName: tCell, bundle: nil), forCellReuseIdentifier: tCell)
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 100
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let story = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = story.instantiateViewController(withIdentifier: "sVC")
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

