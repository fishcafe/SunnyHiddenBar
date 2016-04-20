//
//  ViewController.swift
//  SunnyHiddenBar
//
//  Created by amaker on 04/19/2016.
//  Copyright (c) 2016 amaker. All rights reserved.
//

import UIKit
import SunnyHiddenBar

class ViewController: UITableViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationController!.navigationBar.barTintColor = UIColor.blackColor()
        
//        self.automaticallyAdjustsScrollViewInsets = false
        
        self.isTitleAlpha = true
        self.keyScrollView = self.tableView
         self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 200
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        cell.textLabel!.text = "test..."
        return cell
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.setInViewWillAppear()
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        self.setInViewWillDisappear()
    }
    
    override func scrollViewDidScroll(scrollView: UIScrollView) {
        self.scrollControlByOffsetY(200)
    }
    
    

}

