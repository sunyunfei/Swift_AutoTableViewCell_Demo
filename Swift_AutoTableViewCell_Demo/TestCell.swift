//
//  TestCell.swift
//  Swift_AutoTableViewCell_Demo
//
//  Created by 孙云飞 on 2018/8/27.
//  Copyright © 2018年 孙云飞. All rights reserved.
//

import UIKit

class TestCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var contentlabel: UILabel!
    
    var model:TestModel?{
        
        didSet{
            
            setData()
            
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }

    
    func setData(){
        
        titleLabel.text = model?.title
        contentlabel.text = model?.content
        
        DispatchQueue.global().async {
            
            do {
                
               let data = try Data.init(contentsOf: URL.init(string: (self.model?.icon)!)!)
                
                DispatchQueue.main.async {
                    
                    self.icon.image = UIImage.init(data: data)
                }
            } catch  {
                
                print("icon load error")
            }
            
            
            
        }
    }
    
}
