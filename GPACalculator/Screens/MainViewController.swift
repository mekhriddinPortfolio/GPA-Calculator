//
//  MainViewController.swift
//  GPACalculator
//
//  Created by Mekhriddin Jumaev on 02/02/23.
//

import UIKit
import SnapKit
import SwipeCellKit


var semesters = [Semester]()

class MainViewController: UIViewController {
    
    var cellTapped : ((Int) -> Void)?
    
    var isEmpty: Bool = true {
        didSet {
            if isEmpty {
                imageView.isHidden = false
                mainLabel.isHidden = false
            } else {
                imageView.isHidden = true
                mainLabel.isHidden = true
            }
        }
    }
    
    lazy var imageView = UIImageView(image: UIImage(named: "main"))
    lazy var mainLabel = MainLabel(text: "Please tap + button on the right top of the screen to add semesters ", textColor: UIColor.init(hex: "#B1B1B1"), textAlignment: .center, font: UIFont(name: "Poppins-Medium", size: 15)!)
    lazy var tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        semesters = DataManager.shared.semesters()
        isEmpty = semesters.isEmpty
        configureUI()
        configureTableView()
        addSubviews()
        setContraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tableView.reloadData()
    }

    
    @objc private func plusTapped() {
        let filterVC = AddSemesterViewController(isSubject: false)
        filterVC.modalPresentationStyle = .custom
        filterVC.transitioningDelegate = self
        self.present(filterVC, animated: true, completion: nil)
        filterVC.onDoneBlock = { [weak self] markedSemesters in
            if markedSemesters.isEmpty { return }
            for markedSemester in markedSemesters {
                let semester = DataManager.shared.semester(semester: markedSemester)
                semesters.append(semester)
                DataManager.shared.save()
            }
            semesters = semesters.sorted(by: { $0.key < $1.key })
            self?.tableView.reloadData()
            self?.isEmpty = semesters.isEmpty
        }
    }
    
    private func configureUI() {
        view.backgroundColor =  UIColor(named: "BackgroundColor")
        self.navigationItem.titleView = twoLineTitleView(text: "Semesters")
        navigationController?.backgroundColor(backgroundcolor: UIColor(named: "BackgroundColor")!)
       
        navigationItem.setRightBarButton(UIBarButtonItem(image: UIImage(named: "plus"), style: .done, target: self, action: #selector(plusTapped)), animated: true)
        navigationItem.rightBarButtonItem?.tintColor = blueColor
    }
    
    private func configureTableView() {
        tableView.register(MainTableViewCell.self, forCellReuseIdentifier: MainTableViewCell.reuseID)
        tableView.backgroundColor = .clear
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.dataSource = self
        view.addSubview(tableView)
        tableView.frame = view.bounds
    }
    
    private func addSubviews() {
        view.addSubview(imageView)
        view.addSubview(mainLabel)
    }
    
    private func setContraints() {
        imageView.snp.makeConstraints { make in
            make.height.width.equalTo(200)
            make.centerX.equalTo(view)
            make.top.equalTo(view).offset(214)
        }
        
        mainLabel.snp.makeConstraints { make in
            make.leading.equalTo(view).offset(70)
            make.trailing.equalTo(view).offset(-70)
            make.top.equalTo(imageView.snp.bottom).offset(80)
        }
    }
}

extension MainViewController: UITableViewDataSource, UITableViewDelegate, SwipeTableViewCellDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return semesters.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.reuseID, for: indexPath) as? MainTableViewCell else { return UITableViewCell() }
        cell.selectionStyle = .none
        cell.backgroundColor = .clear
        cell.accessoryType = .disclosureIndicator
        cell.delegate = self
        cell.setData(sem: semesters[indexPath.row])
        if indexPath.row == semesters.count - 1 {
            cell.lineView.backgroundColor = .white
        } else {
            cell.lineView.backgroundColor = UIColor.init(hex: "B8C2C0").withAlphaComponent(0.7)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = GradesViewController(index: indexPath.row)
        vc.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
        guard orientation == .right else { return nil }

        let deleteAction = SwipeAction(style: .destructive, title: "Delete") { action, indexPath in
            // handle action by updating model with deletion
        }

        // customize the action appearance
        deleteAction.image = UIImage(systemName: "trash")
        deleteAction.font = UIFont(name: "Poppins-Medium", size: 13)!
        return [deleteAction]
    }
    
    func tableView(_ tableView: UITableView, editActionsOptionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> SwipeOptions {
        var options = SwipeOptions()
        options.expansionStyle = .destructive
        options.transitionStyle = .border
        return options
    }

}

extension MainViewController: UIViewControllerTransitioningDelegate {
    // 2.
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        let filterPreCont = FilterPresentationController(presentedViewController: presented, presenting: presenting)
        filterPreCont.setHeight(390)
        return filterPreCont
    }
}


