//
//  ViewController.swift
//  ScrollTesting
//
//  Created by Sultan Karybaev on 08.07.2018.
//  Copyright © 2018 Sultan Karybaev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var container: UIView!
    @IBOutlet weak var scroll: UIScrollView!
    var views: [String: UIView] = [:]
    var currentViewController: UIViewController?
    var sc: ScrollController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        views["view"] = view
        
//        scroll.contentInsetAdjustmentBehavior = .never
//        scroll.bounces = false
        let v = UIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 60))
        v.backgroundColor = UIColor.brown
        let v2 = UIView(frame: CGRect(x: 0, y: view.bounds.height - 60, width: view.bounds.width, height: 60))
        v2.backgroundColor = UIColor.orange
        view.addSubview(v)
        view.insertSubview(v2, at: 2)
//        print(scroll.contentInset)
        print(UIDevice.modelName)
        print(childViewControllers)
//        container.emded
        
        guard let conController = childViewControllers.first as? conController else  {
            fatalError("Check storyboard for missing LocationTableViewController")
        }
        conController.delegate = self
        
        print(conController.views)
        
        
        
//        let controller = storyboard!.instantiateViewController(withIdentifier: "Second")
//        addChildViewController(controller)
//        controller.view.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(controller.view)
//
//        NSLayoutConstraint.activate([
//            controller.view.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
//            controller.view.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
//            controller.view.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
//            controller.view.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10)
//            ])
//
//        controller.didMove(toParentViewController: self)
        
        
//        scroll.contentSize = CGSize(width: view.bounds.width, height: view.bounds.height - 120)
        
        
        
        self.currentViewController = self.storyboard!.instantiateViewController(withIdentifier: "conController")
        let cc = self.currentViewController as? conController
        cc?.delegate = self
        self.currentViewController!.view.translatesAutoresizingMaskIntoConstraints = false
        self.addChildViewController(self.currentViewController!)
        self.addSubview(subView: self.currentViewController!.view, toView: self.container)
        
    }
    
    func addSubview(subView: UIView, toView parentView: UIView) {
        parentView.addSubview(subView)

        var viewBindingsDict = [String: AnyObject]()
        viewBindingsDict["subView"] = subView
        parentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[subView]|",
                                                                                 options: [], metrics: nil, views: viewBindingsDict))
        parentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[subView]|",
                                                                                 options: [], metrics: nil, views: viewBindingsDict))
    }
    
    func cycleFromViewController(oldViewController: UIViewController, toViewController newViewController: UIViewController) {
        oldViewController.willMove(toParentViewController: nil)
        self.addChildViewController(newViewController)
        self.addSubview(subView: newViewController.view, toView: self.container)
        newViewController.view.alpha = 0
        newViewController.view.layoutIfNeeded()
        UIView.animate(withDuration: 0.5, animations: {
            newViewController.view.alpha = 1
            oldViewController.view.alpha = 0
        },
                                   completion: { finished in
                                    oldViewController.view.removeFromSuperview()
                                    oldViewController.removeFromParentViewController()
                                    newViewController.didMove(toParentViewController: self)
        })
    }

    
}

extension ViewController: conControllerDelegate {
    func call() {
        print("ViewController")
        let newViewController = self.storyboard?.instantiateViewController(withIdentifier: "GreenVC")
        newViewController!.view.translatesAutoresizingMaskIntoConstraints = false
        self.cycleFromViewController(oldViewController: self.currentViewController!, toViewController: newViewController!)
        self.currentViewController = newViewController
    }
}

public extension UIDevice {
    
    static let modelName: String = {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        
        func mapToDevice(identifier: String) -> String { // swiftlint:disable:this cyclomatic_complexity
            #if os(iOS)
            switch identifier {
            case "iPod5,1":                                 return "iPod Touch 5"
            case "iPod7,1":                                 return "iPod Touch 6"
            case "iPhone3,1", "iPhone3,2", "iPhone3,3":     return "iPhone 4"
            case "iPhone4,1":                               return "iPhone 4s"
            case "iPhone5,1", "iPhone5,2":                  return "iPhone 5"
            case "iPhone5,3", "iPhone5,4":                  return "iPhone 5c"
            case "iPhone6,1", "iPhone6,2":                  return "iPhone 5s"
            case "iPhone7,2":                               return "iPhone 6"
            case "iPhone7,1":                               return "iPhone 6 Plus"
            case "iPhone8,1":                               return "iPhone 6s"
            case "iPhone8,2":                               return "iPhone 6s Plus"
            case "iPhone9,1", "iPhone9,3":                  return "iPhone 7"
            case "iPhone9,2", "iPhone9,4":                  return "iPhone 7 Plus"
            case "iPhone8,4":                               return "iPhone SE"
            case "iPhone10,1", "iPhone10,4":                return "iPhone 8"
            case "iPhone10,2", "iPhone10,5":                return "iPhone 8 Plus"
            case "iPhone10,3", "iPhone10,6":                return "iPhone X"
            case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4":return "iPad 2"
            case "iPad3,1", "iPad3,2", "iPad3,3":           return "iPad 3"
            case "iPad3,4", "iPad3,5", "iPad3,6":           return "iPad 4"
            case "iPad4,1", "iPad4,2", "iPad4,3":           return "iPad Air"
            case "iPad5,3", "iPad5,4":                      return "iPad Air 2"
            case "iPad6,11", "iPad6,12":                    return "iPad 5"
            case "iPad7,5", "iPad7,6":                      return "iPad 6"
            case "iPad2,5", "iPad2,6", "iPad2,7":           return "iPad Mini"
            case "iPad4,4", "iPad4,5", "iPad4,6":           return "iPad Mini 2"
            case "iPad4,7", "iPad4,8", "iPad4,9":           return "iPad Mini 3"
            case "iPad5,1", "iPad5,2":                      return "iPad Mini 4"
            case "iPad6,3", "iPad6,4":                      return "iPad Pro 9.7 Inch"
            case "iPad6,7", "iPad6,8":                      return "iPad Pro 12.9 Inch"
            case "iPad7,1", "iPad7,2":                      return "iPad Pro 12.9 Inch 2. Generation"
            case "iPad7,3", "iPad7,4":                      return "iPad Pro 10.5 Inch"
            case "AppleTV5,3":                              return "Apple TV"
            case "AppleTV6,2":                              return "Apple TV 4K"
            case "AudioAccessory1,1":                       return "HomePod"
            case "i386", "x86_64":                          return "Simulator \(mapToDevice(identifier: ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"] ?? "iOS"))"
            default:                                        return identifier
            }
            #elseif os(tvOS)
            switch identifier {
            case "AppleTV5,3": return "Apple TV 4"
            case "AppleTV6,2": return "Apple TV 4K"
            case "i386", "x86_64": return "Simulator \(mapToDevice(identifier: ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"] ?? "tvOS"))"
            default: return identifier
            }
            #endif
        }
        
        return mapToDevice(identifier: identifier)
    }()
    
}

