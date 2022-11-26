//
//  ListAddViewController.swift
//  zebra-look
//
//  Created by alexiuce on 2022/11/22.
//

import UIKit

class ListAddViewController: UIViewController {
    
    // Data
    
    
    // UI
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var inputContainerView: UIView!
    
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var searchInput: UITextField!
    
    // Layout
    
    
    @IBOutlet weak var searchIconLeftPaddingLayout: NSLayoutConstraint!
    
    // Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "添加列表"
        // Do any additional setup after loading the view.
        
        inputContainerView.layer.cornerRadius = 17.5
        searchInput.addTarget(self, action: #selector(changedSearchText), for: .editingChanged)
        
        
        tableView.rowHeight = 45
        let nib = UINib(nibName: ListAddCell.nibName, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: ListAddCell.reUsedKey)
        
        
        
    }
    @IBAction func clickedCancelButton(_ sender: UIButton) {
        searchInput.endEditing(true)
        if sender.currentTitle == "取消" {
            UIView.animate(withDuration: 0.35, delay: 0) {
                self.searchIconLeftPaddingLayout.constant = 70
                self.view.layoutIfNeeded()
            }
            return
        }
        // 搜索内容  ...
    }
    
    @objc fileprivate func changedSearchText(){
        print(searchInput.text ?? "")
        guard let st = searchInput.text else { return  }
        let btn_title = st.count > 0 ? "搜索":"取消"
        cancelButton.setTitle(btn_title, for: .normal)
   }
    
}



extension ListAddViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
       
        UIView.animate(withDuration: 0.35, delay: 0) {
            self.searchIconLeftPaddingLayout.constant = 20
            self.view.layoutIfNeeded()
        }
    }
    
}


extension ListAddViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ListAddCell.reUsedKey) as! ListAddCell
        return cell
    }
    
    
}
