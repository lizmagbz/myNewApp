//
//  ButtonTableViewCell.swift
//  myNewProject
//
//  Created by Liz Mabel Gomes on 27/04/23.
//

import UIKit
protocol ButtonTableViewCellDelegate: AnyObject {
    func clickAction()
    func receiveAction()
    func menssageAction()
}

class ButtonTableViewCell: UITableViewCell {
    
    weak var delegate: ButtonTableViewCellDelegate?
    
    static let identifier: String = "ButtonTableViewCell"
    
    lazy var clickButton: UIButton = {
        let button = UIButton()
        button.setTitle("Click", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.backgroundColor = .systemGray
        button.addTarget (self, action: #selector (clickAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var receiveScreenButton: UIButton = {
        let button = UIButton()
        button.setTitle("Recetar", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.backgroundColor = .systemGray
        button.addTarget (self, action: #selector (receiveAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var menssageButton: UIButton = {
        let button = UIButton()
        button.setTitle("Recado", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.backgroundColor = .systemGray
        button.addTarget (self, action: #selector (menssageAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    required init?(coder: NSCoder) {
        fatalError ("init (coder:) has not been implemented")
    }
    
    @objc private func clickAction () {
        delegate?.clickAction()
    }
    
    @objc private func receiveAction () {
        delegate?.receiveAction()
    }
    
    @objc private func menssageAction () {
        delegate?.menssageAction()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(clickButton)
        contentView.addSubview(receiveScreenButton)
        contentView.addSubview(menssageButton)
        selectionStyle = .none
        setConstraints()
    }
    
    private func setConstraints() {
        clickButton.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        clickButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24).isActive = true
        clickButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24).isActive = true
        clickButton.widthAnchor.constraint(equalToConstant: 327).isActive = true
        clickButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        
        receiveScreenButton.topAnchor.constraint(equalTo: clickButton.bottomAnchor, constant: 8).isActive = true
        receiveScreenButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24).isActive = true
        receiveScreenButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24).isActive = true
        receiveScreenButton.widthAnchor.constraint(equalToConstant: 327).isActive = true
        receiveScreenButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        
        menssageButton.topAnchor.constraint(equalTo: receiveScreenButton.bottomAnchor, constant: 8).isActive = true
        menssageButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24).isActive = true
        menssageButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24).isActive = true
        menssageButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -24).isActive = true
        menssageButton.widthAnchor.constraint(equalToConstant: 327).isActive = true
        menssageButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
    }
}

