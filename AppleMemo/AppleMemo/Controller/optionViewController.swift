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
    
    private var dataSource = [SettingSection]()
    
    var titleText : String?
    
    
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customUI()
        self.refresh()
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

extension optionViewController:UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch self.dataSource[section] {
        case let .option1(optionModels1):
            return optionModels1.count
        case let .option2(optionModel2):
            return optionModel2.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            switch self.dataSource[indexPath.section] {
            case let .option1(optionModels1):
                let cell = optionTableView.dequeueReusableCell(withIdentifier: "optionTableViewCell", for: indexPath) as! optionTableViewCell
                let optionModelOne = optionModels1[indexPath.row]
                cell.configureCell(icon: optionModelOne.iconImage, titleText: optionModelOne.title)
                return cell
            case let .option2(optionModels2):
                let cell = optionTableView.dequeueReusableCell(withIdentifier: "optionTableViewCell", for: indexPath) as! optionTableViewCell
                let optionModelTwo = optionModels2[indexPath.row]
                cell.configureCell(icon: optionModelTwo.iconImage, titleText: optionModelTwo.title)
                return cell
            }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch self.dataSource[indexPath.section] {
        case let .option1(optionModels1):
            let optionModelOne = optionModels1[indexPath.row]
            if optionModelOne.title == "정보" {
                let optionVC : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                guard let VC = optionVC.instantiateViewController(withIdentifier: "infoViewController") as? infoViewController else { return }
                self.present(VC, animated: true)
            }
        case let .option2(optionModels2):
            break
        }
        
        
        
    }
    
    
}
