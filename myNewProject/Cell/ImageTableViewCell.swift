//
//  ImageTableViewCell.swift
//  myNewProject
//
//  Created by Liz Mabel Gomes on 27/04/23.
//

import UIKit

class ImageTableViewCell: UITableViewCell {
    
    static let identifier: String = "ImageTableViewCell"
    
    private lazy var Image: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Image")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .center
        return imageView
    }()
    
    required init?(coder: NSCoder) {
        fatalError ("init (coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(Image)
        setConstraints()
    }
    
    private func setConstraints() {
        Image.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        Image.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        Image.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        Image.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true

        
    }
}
