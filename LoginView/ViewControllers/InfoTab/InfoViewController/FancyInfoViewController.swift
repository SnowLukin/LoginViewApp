//
//  FancyInfoViewController.swift
//  LoginView
//
//  Created by Snow Lukin on 19.12.2021.
//

import UIKit

class FancyInfoViewController: UIViewController {
    
    // MARK: Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Properties
    var user: User?
    var userInfoSections = [[String]]()

    var editUserInfoButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        return button
    }()
    
    var buttonContainerView: UIView = {
        let view = UIView()
        view.setLightBlueColor()
        return view
    }()
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userInfoSections = [
            [user?.userName ?? ""],
            [user?.person.name ?? "", user?.person.surname ?? ""],
            [user?.person.bio ?? ""]
        ]
        
        
        view.setBlueColor()
        setTableView()
        setHeader()
        view.addSubview(tableView)
        hideKeyboardOnTap()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        editUserInfoButton.layer.cornerRadius = editUserInfoButton.frame.width / 2
    }

    // MARK: Override Methods
    
    // Light Status Bar
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    
    // MARK: Public Methods
    
    @objc func hideKeyboard() {
        tableView.endEditing(true)
    }
    
    
    // MARK: Private Methods
    
    private func setTableView() {
        tableView.setBlueColor()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
        tableView.separatorStyle = .none
    }
    
    private func setHeader() {
        let header = HeaderTableView(frame: CGRect(x: 0, y: 0,
                                                   width: view.frame.width,
                                                   height: view.frame.width * 2 / 3))
        header.imageView.image = UIImage(named: "StreetImage")
        tableView.tableHeaderView = header
    }
    
    private func hideKeyboardOnTap() {
        tableView.keyboardDismissMode = .onDrag
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.hideKeyboard))
        tapGesture.cancelsTouchesInView = true
        tableView.addGestureRecognizer(tapGesture)
    }
}

// MARK: - Extensions

extension FancyInfoViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Username"
        case 1:
            return "Name"
        case 2:
            return "Bio"
        default:
            return ""
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = .gray
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return userInfoSections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userInfoSections[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! InfoCell
        
        cell.infoLabel.text = userInfoSections[indexPath.section][indexPath.row]
        
        cell.containerView.layer.cornerRadius = 20
        
        // fancy rounded corners
        if indexPath.section == 1 {
            if indexPath.row == 0 {
                cell.containerView.layer.maskedCorners = [.layerMinXMinYCorner]
                return cell
            } else {
                cell.containerView.layer.maskedCorners = [.layerMaxXMaxYCorner]
                return cell
            }
        }
        cell.containerView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMaxYCorner]
        return cell
    }
}

extension FancyInfoViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension FancyInfoViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let header = tableView.tableHeaderView as? HeaderTableView else { return }
        header.scrollViewDidScroll(scrollView: tableView)
    }
}
