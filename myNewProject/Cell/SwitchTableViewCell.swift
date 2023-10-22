//
//  SwitchTableViewCell.swift
//  myNewProject
//
//  Created by Liz Mabel Gomes on 27/04/23.
//

import UIKit
protocol SwitchTableViewCellDelegate: AnyObject {
    func tappedSwitch(isDarkMode: Bool)
}

class SwitchTableViewCell: UITableViewCell {
    
    weak var delegate: SwitchTableViewCellDelegate?
    
    static let identifier: String = "SwitchTableViewCell"
    
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            darkModeLabel,
            buttonSwitch
        ])
        stackView.spacing = 4
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.alignment = .leading
        stackView.backgroundColor = .clear
        stackView.layoutMargins = UIEdgeInsets(top: 24, left: 20, bottom: 24, right: 20)
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var darkModeLabel: UILabel = {
        let label = UILabel()
        label.text = "Modo escuro"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .systemGray2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var buttonSwitch: UISwitch = {
        let button = UISwitch()
        button.onTintColor = .systemGreen
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(self.tappedSwitch), for: .valueChanged)
        return button
    }()
    
    required init?(coder: NSCoder) {
        fatalError ("init (coder:) has not been implemented")
    }
    
    @objc func tappedSwitch() {
    delegate?.tappedSwitch(isDarkMode: buttonSwitch.isOn)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(mainStackView)
        setConstraints()
    }
    
    private func setConstraints() {
        mainStackView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        mainStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24).isActive = true
        mainStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        mainStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
}
    
  

