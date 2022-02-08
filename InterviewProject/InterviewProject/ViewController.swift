//
//  ViewController.swift
//  InterviewProject
//
//  Created by Raju on 07/02/22.
// 

/*
 
 Rameez Khan5:12 PM
 Alphabets
 A
 B
 C
 D
 E
 Numbers
 1
 2
 */

import UIKit

var serviceData = ["Alphabets" : ["a", "b", "c"], "Numbers" : ["1", "2", "3"]]
class ViewController: UIViewController {
    let viewModel = ViewModel(serData: serviceData)
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.allSectionKey.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let keyStr = viewModel.allSectionKey[section]
        let vals = viewModel.datas[keyStr]
        return vals?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = String(describing: TableViewCell.self)
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as! TableViewCell
        let keyStr = viewModel.allSectionKey[indexPath.section]
        let vals = viewModel.datas[keyStr]
        cell.valueLabel.text = vals?[indexPath.row]
        return cell;
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let leftPad = "   "
        let secLabel = UILabel()
        secLabel.text = leftPad + viewModel.allSectionKey[section]
        secLabel.font = UIFont.boldSystemFont(ofSize: 20.0)
        secLabel.backgroundColor = .white
        return  secLabel
    }
    
}
