//
//  ExampleListViewController.swift
//  RXMis
//
//  Created by 杨洋 on 2021/8/16.
//

import UIKit

class ExampleListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
 
    var modelArr = ["stackView使用练习", "yagaKit使用练习"];

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    lazy var tableView: UITableView = {
        let tableview = UITableView.init(frame: CGRect.zero, style: .plain)
        tableview.delegate = self
        tableview.dataSource = self
        tableview.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
        return tableview
       }()
 

}


extension ExampleListViewController{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = modelArr[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}
