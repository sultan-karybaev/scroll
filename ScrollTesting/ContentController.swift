//
//  ContentController.swift
//  ScrollTesting
//
//  Created by Sultan Karybaev on 09.07.2018.
//  Copyright © 2018 Sultan Karybaev. All rights reserved.
//

import UIKit

class ContentController: UIViewController {
    @IBOutlet weak var scroll: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        scroll.delegate = self as! UIScrollViewDelegate
        
        scroll.contentInsetAdjustmentBehavior = .never
        scroll.bounces = false
        let v = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: view.bounds.height))
        v.backgroundColor = UIColor.black
        let v2 = UIView(frame: CGRect(x: 0, y: view.bounds.height, width: 10, height: view.bounds.height/2))
        v2.backgroundColor = UIColor.green
        
        let newView = UIView()
        newView.backgroundColor = UIColor.red
        view.addSubview(newView)
        
        newView.translatesAutoresizingMaskIntoConstraints = false
        
        let horizontalConstraint = NSLayoutConstraint(item: newView, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0)
        let verticalConstraint = NSLayoutConstraint(item: newView, attribute: .top, relatedBy: NSLayoutRelation.equal, toItem: self.view, attribute: .top, multiplier: 1, constant: 100)
        let widthConstraint = NSLayoutConstraint(item: newView, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: 100)
        let heightConstraint = NSLayoutConstraint(item: newView, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: 1000)
        self.view.addConstraints([horizontalConstraint, verticalConstraint, widthConstraint, heightConstraint])
        
//        NSLayoutConstraint(item: <#T##Any#>, attribute: <#T##NSLayoutAttribute#>, relatedBy: <#T##NSLayoutRelation#>, toItem: <#T##Any?#>, attribute: <#T##NSLayoutAttribute#>, multiplier: <#T##CGFloat#>, constant: <#T##CGFloat#>)
//        scroll.contentInset = UIEdgeInsets(top: 100, left: 0, bottom: 100, right: 0)
//
//        scroll.contentSize = CGSize(width: view.bounds.width, height: 100)
        view.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height * 2)
        view.bounds = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height * 2)
//        view.addSubview(v)
//        view.insertSubview(v2, at: 2)
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
