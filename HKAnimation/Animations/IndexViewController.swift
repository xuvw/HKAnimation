//
//  IndexViewController.swift
//  HKAnimation
//
//  Created by heke on 16/7/13.
//  Copyright © 2016年 mhk. All rights reserved.
//

import UIKit

class IndexViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var tableView: UITableView?
    var items: [String]?
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.whiteColor()
        
        title = "索引"
        createData()
        
        tableView = UITableView(frame: view.bounds, style: UITableViewStyle.Plain)
        view.addSubview(tableView!)
        tableView?.dataSource = self
        tableView?.delegate = self
        
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    //MARK: UITableView datasource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return items!.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellID = "cellID"
        var cell = tableView.dequeueReusableCellWithIdentifier(cellID)
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellID)
        }
        
        cell?.textLabel?.text = items![indexPath.row]
        
        return cell!
    }
    
    /**
     */
    func createData() {
        items = ["anchorPoint",//
                 "backgroundColor",//
                 "borderColor",//
                 "borderWidth",//
                 "bounds",//
                 "cornerRadius",//
                 "contentsRect",//
                 "opacity",//
                 "position",//
                 "shadowColor",//
                 "shadowOffset",//
                 "shadowOpacity",//
                 "shadowRadius",
                 "shadowPath",
                 "zPosition",
                 "transform.rotation.x",
                 "transform.rotation.y",
                 "transform.rotation.z",
                 "transform.scale.x",
                 "transform.scale.y",
                 "transform.scale.z",
                 "transform.scale",
                 "transform.translation.x",
                 "transform.translation.y",
                 "transform.translation.z",
                 "transform.translation",
                 "transition",
                 "flipAnimation"]
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
        
        switch items![indexPath.row] {
        
        case "flipAnimation":
            let vc = flipViewController()
            vc.title = "flipAnimation"
            navigationController?.pushViewController(vc, animated: true)
        case "transition":
            let vc = transitionViewController()
            vc.title = "transition"
            navigationController?.pushViewController(vc, animated: true)
        case "transform.translation.x":
            let vc = translationByXViewController()
            vc.title = "transform.translation.x"
            navigationController?.pushViewController(vc, animated: true)
        case "transform.translation.y":
            let vc = translationByYViewController()
            vc.title = "transform.translation.y"
            navigationController?.pushViewController(vc, animated: true)
        case "transform.translation.z":
            let vc = translationByZViewController()
            vc.title = "transform.translation.z"
            navigationController?.pushViewController(vc, animated: true)
        case "transform.translation":
            let vc = translationViewController()
            vc.title = "transform.translation.z"
            navigationController?.pushViewController(vc, animated: true)
        case "transform.scale":
            let vc = scaleViewController()
            vc.title = "transform.scale"
            navigationController?.pushViewController(vc, animated: true)
        case "transform.scale.z":
            let vc = scaleByZViewController()
            vc.title = "transform.scale.z"
            navigationController?.pushViewController(vc, animated: true)
        case "transform.scale.y":
            let vc = scaleByYViewController()
            vc.title = "transform.scale.y"
            navigationController?.pushViewController(vc, animated: true)
        case "transform.scale.x":
            let vc = scaleByXViewController()
            vc.title = "transform.scale.x"
            navigationController?.pushViewController(vc, animated: true)
        case "transform.rotation.z":
            let vc = rotationByZViewController()
            vc.title = "transform.rotation.z"
            navigationController?.pushViewController(vc, animated: true)
        case "transform.rotation.y":
            let vc = rotationByYViewController()
            vc.title = "transform.rotation.y"
            navigationController?.pushViewController(vc, animated: true)
        case "transform.rotation.x":
            let vc = rotationByXViewController()
            vc.title = "transform.rotation.x"
            navigationController?.pushViewController(vc, animated: true)
        case "zPosition":
            let vc = zPositionViewController()
            navigationController?.pushViewController(vc, animated: true)
        case "shadowPath":
            let vc = shadowPathViewController()
            navigationController?.pushViewController(vc, animated: true)
        case "shadowRadius":
            let vc = shadowRadiusViewController()
            navigationController?.pushViewController(vc, animated: true)
        case "shadowOpacity":
            let vc = shadowOpacityViewController()
            navigationController?.pushViewController(vc, animated: true)
        case "shadowOffset":
            let vc = shadowOffsetViewController()
            navigationController?.pushViewController(vc, animated: true)
        case "shadowColor":
            let vc = shadowColorViewController()
            navigationController?.pushViewController(vc, animated: true)
        case "anchorPoint":
            let vc = anchorPointViewController()
            navigationController?.pushViewController(vc, animated: true)
        case "backgroundColor":
            let vc = backgroundColorViewController()
            navigationController?.pushViewController(vc, animated: true)
        case "borderColor":
            let vc = borderColorViewController()
            navigationController?.pushViewController(vc, animated: true)
        case "borderWidth":
            let vc = borderWidthViewController()
            navigationController?.pushViewController(vc, animated: true)
        case "bounds":
            let vc = boundsViewController()
            navigationController?.pushViewController(vc, animated: true)
        case "cornerRadius":
            let vc = cornerRadiusViewController()
            navigationController?.pushViewController(vc, animated: true)
        case "contentsRect":
            let vc = contentsRectViewController()
            navigationController?.pushViewController(vc, animated: true)
        case "opacity":
            let vc = opacityViewController()
            navigationController?.pushViewController(vc, animated: true)
        case "position":
            let vc = positionViewController()
            navigationController?.pushViewController(vc, animated: true)
        default:
            print("开发中")
        }
    }
}
