//
//  ListEditViewController.swift
//  zebra-look
//
//  Created by alexiuce on 2022/11/21.
//

import UIKit

class ListEditViewController: UIViewController {

    
    
    private var moveCellImg: UIView?
    private var originIndex: Int = -1   //初始移动下标
    let array: NSMutableArray = [1,2,3,4,5]
    
    @IBOutlet weak var headerContainerView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var allChoiceButton: UIButton!
    
    @IBOutlet weak var deleteButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "编辑列表"
        
        headerContainerView.layer.cornerRadius = 13
        headerContainerView.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
        
        tableView.rowHeight = 55
        let cnib = UINib.init(nibName: ListEditCell.nibName, bundle: nil)
        tableView.register(cnib, forCellReuseIdentifier: ListEditCell.reUsedKey)
        
        deleteButton.layer.cornerRadius = 25
        
        
        
        //手势
        let longPressGes = UILongPressGestureRecognizer(target: self, action: #selector(drapCell))
        longPressGes.minimumPressDuration = 0.5
        tableView.addGestureRecognizer(longPressGes)
        
    }
    
    @IBAction func clickedChoiceButton(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        
        let colorName = sender.isSelected ? "3eRedColor" : "viewBgColor"
        deleteButton.isSelected = sender.isSelected
        deleteButton.backgroundColor = UIColor(named: colorName)
        
    }
    
    @IBAction func clickedDeleteButton(_ sender: UIButton) {
        
    }
}

extension ListEditViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ListEditCell.reUsedKey) as! ListEditCell
        cell.cellDelegate = self
        return cell
    }
}

//MARK: - private func
extension ListEditViewController {
    
    @objc func drapCell(longPressGes: UILongPressGestureRecognizer) {
        let point = longPressGes.location(in: tableView)
        guard let indexPath = tableView.indexPathForRow(at: point) else { return  }
        
        switch longPressGes.state {
        case .began:
            originIndex = indexPath.row
            if let cell = tableView.cellForRow(at: indexPath) {
                moveCellImg = cell.snapshotView(afterScreenUpdates: false)
                view.addSubview(moveCellImg!)
                setMoveImgVPoint(longPressGes: longPressGes)
                //将要拖动的原cell隐藏
                cell.isHidden = true
            }
            
        case .changed:
            if indexPath.row != originIndex {
                let sourceIndex = IndexPath(row: originIndex, section: 0)
                tableView.moveRow(at: sourceIndex, to: indexPath)
                array.exchangeObject(at: originIndex, withObjectAt: indexPath.row)
                
                originIndex = indexPath.row
            }
            
            setMoveImgVPoint(longPressGes: longPressGes)
        case.ended:
            
            if indexPath.row == originIndex || originIndex == -1 {
                resetMoveTableViewCellAnimation()
                return
            }
            array.exchangeObject(at: originIndex, withObjectAt: indexPath.row)
            
            resetMoveTableViewCellAnimation()
        default:
            resetMoveTableViewCellAnimation()
            break
        }
       }
       
       //cell跟随手指位置
       func setMoveImgVPoint(longPressGes: UILongPressGestureRecognizer) {
           let newPoin = longPressGes.location(in: view)
//           moveCellImg?.x = newPoin.x - moveCellImg!.width / 2
           moveCellImg?.transform = CGAffineTransformMakeScale(1.05, 1.05)
           moveCellImg?.y = newPoin.y - moveCellImg!.height / 2
       }
       
       //结束动画
       func resetMoveTableViewCellAnimation() {
           moveCellImg?.removeFromSuperview()
           moveCellImg = nil
           tableView.reloadData()
       }
}
extension ListEditViewController: ListEditCellDelegate {
    func editCellDidClickedTopUpEvent(cell: ListEditCell) {   // 点击置顶事件
        guard let indexPath = tableView.indexPath(for: cell) else { return }
        tableView.moveRow(at: indexPath, to: IndexPath(row: 0, section: 0))
        let element = array[indexPath.row]
        array.removeObject(at: indexPath.row)
        array.insert(element, at: 0)
        array.forEach { ele in
            print(ele)
        }
    }
}
