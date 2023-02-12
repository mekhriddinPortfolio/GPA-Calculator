//
//  SettingsViewController.swift
//  GPACalculator
//
//  Created by Mekhriddin Jumaev on 10/02/23.
//

import UIKit

class SettingsViewController: UIViewController {
    
    lazy var tableView = UITableView()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "BackgroundColor")
        self.navigationItem.titleView = twoLineTitleView(text: "Settings")
        navigationController?.backgroundColor(backgroundcolor: UIColor.white)
        configureTableView()
    }

    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(SettingsTableViewCell.self, forCellReuseIdentifier: SettingsTableViewCell.reuseID)
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        view.addSubview(tableView)
        tableView.frame = view.bounds
        
    }
}

extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingsTableViewCell.reuseID, for: indexPath) as? SettingsTableViewCell else { return UITableViewCell() }
        cell.setData(setting: settings[indexPath.row])
        cell.backgroundColor = .clear
        cell.modeChanged = { [weak self] result in
            if result {
                if let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate {
                    sceneDelegate.window?.overrideUserInterfaceStyle = .dark
                }
            } else {
                if let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate {
                    sceneDelegate.window?.overrideUserInterfaceStyle = .light
                }
            }
            
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settings.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            print("Change grading system")
        case 1:
            print("Change language")
        case 3:
            print("Contact dev")
        case 4:
            print("Share app")
        default:
            print("xxx")
        }
    }
}

struct Setting {
    let name: String
    let icon: UIImage
    let desc: String?
    let hasSwitch: Bool
}

let settings = [
    Setting(name: "Grading system", icon: UIImage(systemName: "square.and.pencil")!, desc: "5.0(Uzbekistan)", hasSwitch: false),
    Setting(name: "Language", icon: UIImage(systemName: "globe.europe.africa")!, desc: "English", hasSwitch: false),
    Setting(name: "Dark mode", icon: UIImage(systemName: "cloud.moon")!, desc: nil, hasSwitch: true),
    Setting(name: "Contact developer", icon: UIImage(systemName: "phone.arrow.up.right")!, desc: nil, hasSwitch: false),
    Setting(name: "Share app", icon: UIImage(systemName: "arrowshape.turn.up.right")!, desc: nil, hasSwitch: false)
]
