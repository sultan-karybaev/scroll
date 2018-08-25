//
//  ScrollController.swift
//  ScrollTesting
//
//  Created by Sultan Karybaev on 09.07.2018.
//  Copyright © 2018 Sultan Karybaev. All rights reserved.
//

import UIKit

protocol storyDelegate {
    func perSegue()
}

class ScrollController: UIViewController {
    
    public var delegate: storyDelegate?
    public var asd = 123

    @IBOutlet weak var scroll: UIScrollView!
    
    @IBOutlet weak var df: UIButton!
    @IBAction func fg(_ sender: Any) {
        print("qwe")
        print(sender)
        performSegue(withIdentifier: "secondSegue", sender: self)
    }
    
    @IBAction func green(_ sender: Any) {
        print("qwe")
        delegate?.perSegue()
        //let sender = storyboard!.instantiateViewController(withIdentifier: "conController") as! conController
        //performSegue(withIdentifier: "greenSegue", sender: sender)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scroll.contentInsetAdjustmentBehavior = .never
        scroll.bounces = false
        print(scroll.contentSize)
        
//        scroll.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 100, right: 0)
//        scroll.setContentOffset(CGPoint(x: 100, y: 200), animated: true)
//        scroll.contentSize = CGSize(width: view.bounds.width, height: 300)
        
        
    }
    
    override func viewDidLayoutSubviews() {
        scroll.contentOffset = CGPoint(x: 0, y: 200)
    }
    
    @IBAction func back(for unwindSegue: UIStoryboardSegue) {
        
    }
    
    
    
    
}
