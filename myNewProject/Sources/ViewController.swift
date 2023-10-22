//
//  ViewController.swift
//  myNewProject
//
//  Created by Liz Mabel Gomes on 27/04/23.
//

import UIKit
import AlertModule

class ViewController: UIViewController {
    
    var buttonSwitch = false
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(SwitchTableViewCell.self, forCellReuseIdentifier: SwitchTableViewCell.identifier)
        tableView.register(ImageTableViewCell.self, forCellReuseIdentifier: ImageTableViewCell.identifier)
        tableView.register(ButtonTableViewCell.self, forCellReuseIdentifier: ButtonTableViewCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        configConstraints()
    }
    
    private func configConstraints(){
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint (equalTo:  view.bottomAnchor),
        ])
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SwitchTableViewCell.identifier, for: indexPath) as? SwitchTableViewCell else {
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            cell.delegate = self
            cell.buttonSwitch.isOn = buttonSwitch
            return cell
        }
        else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: ImageTableViewCell.identifier, for: indexPath)
            cell.selectionStyle = .none
            return cell
        }
        else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ButtonTableViewCell.identifier, for: indexPath) as? ButtonTableViewCell else {
                return UITableViewCell()
            }
            cell.delegate = self
            cell.selectionStyle = .none
            return cell
        }
    }
    
    override func didReceiveMemoryWarning() {
                super.didReceiveMemoryWarning()
            }
}

extension ViewController: ButtonTableViewCellDelegate {
    func clickAction() {
        print("oi:)")
    }
   
    func receiveAction() {
        tappedSwitch(isDarkMode: false)
        buttonSwitch = false
        tableView.reloadData()
    }
    
    func menssageAction() {
        MainView.showMessage()
        let alert = UIAlertController(title: "Recado", message: "Bem vindo!! ", preferredStyle: .alert)
        let closedAction = UIAlertAction(title: "Fechar", style: .destructive)
        alert.addAction(closedAction)
        
        present(alert, animated: true)
    }
}

extension ViewController: SwitchTableViewCellDelegate {
    func tappedSwitch(isDarkMode: Bool) {
        buttonSwitch = isDarkMode
        if isDarkMode {
            view.overrideUserInterfaceStyle = .dark
        } else {
            view.overrideUserInterfaceStyle = .light
        }
        tableView.reloadData()
        viewDidLoad()
    }
}
    
