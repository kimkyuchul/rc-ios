//
//  optionViewController.swift
//  AppleMemo
//
//  Created by qualson1 on 2022/08/01.
//

import UIKit



class optionViewController: UIViewController {

    @IBOutlet var optionTableView: UITableView!
    @IBOutlet var optionXbutton: UIButton!
    @IBOutlet var optionTitleLabel: UILabel!
    @IBOutlet var optionTitleImage: UIImageView!
    
    let list = SettingSection.generateData()
    var titleText : String?
    
    
    /*
    private func refresh() {
    
    let optionModels1 = [
        optionOne(title: "갤러리로보기", iconImage: UIImage(systemName: "pencil")),
        optionOne(title: "정보", iconImage: UIImage(systemName: "square.and.arrow.up.fill")),
      ]
    let optionSection1 = SettingSection.option1(optionModels1)
        
    
    let optionModels2 = [
            optionTwo(title: "메모 선택", iconImage: UIImage(systemName: "pencil")),
            optionTwo(title: "기본값 순서로 메모 정렬", iconImage: UIImage(systemName: "square.and.arrow.up.fill")),
            optionTwo(title: "첨부 파일 보기", iconImage: UIImage(systemName: "paperplane.fill"))
          ]
    let optionSection2 = SettingSection.option2(optionModels2)
        
        self.dataSource = [optionSection1, optionSection2]
        self.optionTableView.reloadData()
    }
     */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customUI()
        //self.refresh()
        optionTableView.delegate = self
        optionTableView.dataSource = self
        
        let nibName = UINib(nibName: "optionTableViewCell", bundle: nil)
        self.optionTableView.register(nibName, forCellReuseIdentifier: "optionTableViewCell")
        
        optionTableView.backgroundColor = UIColor.tertiarySystemGroupedBackground

    }
    
    
    func customUI() {
        self.view.backgroundColor = UIColor.tertiarySystemGroupedBackground
        optionTitleImage.image = UIImage(systemName:"folder.fill")
        optionTitleLabel.text = titleText
        optionTitleLabel.sizeToFit()
        
        optionXbutton.setImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
        //optionXbutton.imageEdgeInsets = UIEdgeInsets(top: 30, left: 30, bottom: 30, right: 30)
        
        //var config = UIButton.Configuration.filled()
        
        
    }
}

//https://velog.io/@din0121/Swift-Table-View-Multi-Section
extension optionViewController:UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list[section].items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let target = list[indexPath.section].items[indexPath.row] // 셀에 표시할 데이터 가져옴
        guard let cell = optionTableView.dequeueReusableCell(withIdentifier: "optionTableViewCell") as? optionTableViewCell else { return UITableViewCell() }
        
        switch target.type {
        case .detailTitle:
            cell.optionTableViewLabel?.text = target.title
            cell.optionTableViewImage?.image = target.iconImage
        case .rightDetail:
            cell.optionTableViewLabel?.text = target.title
            cell.optionTableViewImage?.image = target.iconImage
            
        }
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.list.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let target = list[indexPath.section]
        switch target.items {
        case 0:
            if target.items[indexPath.row] == 0 {
                
            }
        }
            
        }
    
    
    
}
