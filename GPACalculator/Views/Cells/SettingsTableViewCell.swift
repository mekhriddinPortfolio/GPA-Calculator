//
//  SettingsTableViewCell.swift
//  GPACalculator
//
//  Created by Mekhriddin Jumaev on 10/02/23.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {
    
    static let reuseID = "SettingsTableViewCell"
    
    var modeChanged: ((Bool) -> Void)?
    
    lazy var backView: UIView = {
        let view = UIView()
        view.layer.backgroundColor = UIColor(red: 0.573, green: 0.639, blue: 0.992, alpha: 0.1).cgColor
        view.layer.cornerRadius = 16
        return view
    }()
    
    lazy var iconImage: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = UIColor.black
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "Icon-Bed")
        return imageView
    }()
    
    lazy var mainLabel = MainLabel(text: "Dark mode", textColor: UIColor.init(hex: "#000000"), textAlignment: .left, font: UIFont(name: "Poppins-Regular", size: 14)!)
    
    lazy var backIconImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "Icon-Arrow")
        return imageView
    }()
    
    lazy var switchControl: UISwitch = {
        let switchControl = UISwitch()
        switchControl.transform = CGAffineTransformMakeScale(0.8, 0.8)
        switchControl.isOn = true
        switchControl.addTarget(self, action: #selector(switchChanged), for: .valueChanged)
        switchControl.isHidden = true
        switchControl.onTintColor = blueColor
        switchControl.onImage = UIImage(named: "Icon-Arrow")
        switchControl.isOn = false
        switchControl.increaseThumb()
        return switchControl
    }()
    
    lazy var descLabel = MainLabel(text: "", textColor: UIColor.init(hex: "#000000"), textAlignment: .right, font: UIFont(name: "Poppins-Regular", size: 12)!)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        setConstraints()
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(setting: Setting) {
        iconImage.image = setting.icon
        mainLabel.text = setting.name
        if let desc = setting.desc {
            descLabel.text = desc
        } else {
            descLabel.text = ""
        }
        if setting.hasSwitch {
            backIconImage.isHidden = true
            switchControl.isHidden = false
        }
    }
    
    @objc func switchChanged() {
        modeChanged?(switchControl.isOn)
    }
    
    private func addSubviews() {
        contentView.addSubview(backView)
        backView.addSubview(iconImage)
        backView.addSubview(mainLabel)
        backView.addSubview(backIconImage)
        backView.addSubview(descLabel)
        backView.addSubview(switchControl)
    }
    
    private func setConstraints() {
        backView.snp.makeConstraints { make in
            make.leading.equalTo(contentView).offset(20)
            make.trailing.equalTo(contentView).offset(-20)
            make.top.equalToSuperview().offset(5)
            make.bottom.equalToSuperview().offset(-5)
        }
        
        iconImage.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(15)
            make.centerY.equalToSuperview()
            make.height.width.equalTo(24)
        }
        
        mainLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(iconImage.snp.trailing).offset(10)
            make.trailing.equalTo(descLabel.snp.leading)
        }
        
        backIconImage.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-15)
            make.centerY.equalToSuperview()
            make.width.equalTo(24)
            make.height.equalTo(24)
        }
        
        descLabel.snp.makeConstraints { make in
            make.trailing.equalTo(backIconImage.snp.leading).offset(-5)
            make.centerY.equalToSuperview()
            make.width.equalTo(100)
        }
        
        switchControl.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-15)
            make.centerY.equalToSuperview()
           
        }
    }
}

extension UISwitch {

func increaseThumb(){
    if let thumb = self.subviews[0].subviews[1].subviews[2] as? UIImageView {
        thumb.transform = CGAffineTransform(scaleX: 0.85, y: 0.85)
    }
  }
}
