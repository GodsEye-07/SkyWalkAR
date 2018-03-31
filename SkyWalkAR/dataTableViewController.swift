//
//  dataTableViewController.swift
//  SkyWalkAR
//
//  Created by Ayush Verma on 31/03/18.
//  Copyright © 2018 Ayush Verma. All rights reserved.
//

import UIKit
import  Firebase

class dataTableViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var data = [NSDictionary]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.delegate = self
        tableView.dataSource = self
        
        tableView.reloadData()
        fetchData()
        
        
    }
    
    //   to fetch all the data that has been saved in the backend and to show it here
    
    func fetchData() {
        
        Database.database().reference().observe(.value, with: {snap in
            print(snap)
            
            self.data.removeAll()
            let x = snap.children.allObjects as! [DataSnapshot]
            for i in x {
                let j = i.value as! Dictionary<String,String>
                self.data.append(j as NSDictionary)
                if i == x.last {
                    self.tableView.reloadData()
                }
            }
        })
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

     func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return data.count
    }
    
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! customTableViewCell
        
        cell.xlab.text = "\(String(describing: data[indexPath.row]["Xcordinate"]))"
        cell.ylab.text = "\(String(describing: data[indexPath.row]["Ycordinate"]))"
        cell.zlab.text = "\(String(describing: data[indexPath.row]["Zcordinate"]))"
            
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0
    }
    
    
    

    

}
