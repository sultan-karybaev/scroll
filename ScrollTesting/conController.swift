//
//  conController.swift
//  ScrollTesting
//
//  Created by Sultan Karybaev on 09.07.2018.
//  Copyright © 2018 Sultan Karybaev. All rights reserved.
//

import UIKit

class conController: UIViewController {

    @IBOutlet weak var button: UIButton!
    @IBAction func buttonTapped(_ sender: Any) {
        print("button")
    }
    
    @IBOutlet weak var scroll: UIScrollView!
    var views: [String: UIView] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        scroll.delegate = self
       
        

        scroll.bounces = false
        
        views["view"] = view
        
        for i in 1...3 {
            print("i \(i)")
            let scrollController = createView(ind: i)
            views["page\(i)"] = scrollController.view
        }
        
        scroll.isPagingEnabled = true
        addConstraints(withViews: views)
    }

    func addConstraints(withViews views: [String: UIView]) {
        let verticalConstraints = NSLayoutConstraint.constraints(
            withVisualFormat: "V:|[page1(==view)]|", options: [], metrics: nil, views: views)
        NSLayoutConstraint.activate(verticalConstraints)
        var wallpaperConstraints = ""
        
        for i in 1...3 {
            wallpaperConstraints += "[page\(i)(==view)]"
        }
        let horizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|\(wallpaperConstraints)|", options: [.alignAllTop, .alignAllBottom], metrics: nil, views: views)
        NSLayoutConstraint.activate(horizontalConstraints)
    }
    
    func createView(ind: Int) -> UIViewController {
        let wallpaper: UIViewController
        if ind < 3 {
            wallpaper = storyboard!.instantiateViewController(withIdentifier: "ScrollController") as! ScrollController
        } else {
            wallpaper = storyboard!.instantiateViewController(withIdentifier: "ContentController") as! ContentController
        }
        
        //        wallpaper.wallpaperImage = UIImage(named: backgroundImageName)
        wallpaper.view.translatesAutoresizingMaskIntoConstraints = false
        scroll.addSubview(wallpaper.view)
        
        addChildViewController(wallpaper)
        wallpaper.didMove(toParentViewController: self)
        
        return wallpaper
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func rt() {
        print("button")
    }

    @IBAction func wqe(_ sender: Any) {
        print("button")
    }
    @IBAction func asd(_ sender: Any) {
        print("button")
    }
}

extension conController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("scrollViewDidScroll")
        print(view.frame.width)
        print(scrollView.contentOffset)
        
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        //print("scrollViewWillBeginDragging")
    }
    
    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        //print("scrollViewWillBeginDecelerating")
    }
    
    
}











