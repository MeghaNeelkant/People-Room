//
//  PeopleViewCell.swift
//  PeopleApp
//
//  Created by Megha Uppin on 09/11/2022.
//

import UIKit

class PeopleViewCell: UITableViewCell {

    var allPeople: PeopleData?
    
    static let reuseID = "\(PeopleViewCell.self)"

    lazy var newImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .white
        imageView.image = UIImage(named: "ImageView")
        imageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        return imageView
    }()

    lazy var FirstNameLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "FirstName"
        label.setContentHuggingPriority(.required, for: .vertical)
        label.setContentCompressionResistancePriority(.required, for: .vertical)
        label.backgroundColor = .systemPurple
        return label
    }()

    lazy var LastNameLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "LastName"
        label.backgroundColor = .systemOrange
        return label
    }()

//    lazy var typeLabel: UILabel = {
//        let label = UILabel(frame: .zero)
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.numberOfLines = 0
//        label.text = "puff /puff"
//        label.backgroundColor = .systemOrange
//        return label
//    }()


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setUpUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setUpUI(){

        let hStack = UIStackView(axis: .horizontal, spacing: 8, distribution: .fill)
        let vStack = UIStackView(axis: .vertical, spacing: 8, distribution: .fill)

        vStack.addArrangedSubview(self.FirstNameLabel)
        vStack.addArrangedSubview(self.LastNameLabel)
//        vStack.addArrangedSubview(self.typeLabel)
        hStack.addArrangedSubview(self.newImageView)
        hStack.addArrangedSubview(vStack)

        self.contentView.addSubview(hStack)

        hStack.bindToSuperView()
    }
    
    public func configure(peopleList: PeopleData, network: NetworkManager) {
        
        self.allPeople = peopleList
        
        FirstNameLabel.text = "\(self.allPeople?.firstName ?? "Firstname")"
        LastNameLabel.text = "\(self.allPeople?.lastName ?? "Lastname")"
        
        if let imageData = ImageCache.shared.getImageData(key: peopleList.avatar) {
            self.newImageView.image = UIImage(data: imageData)
            return
        }
        
        DispatchQueue.main.async {
            
            network.fetchImage(urlStr: peopleList.avatar) { result in
                switch result {
                    case .success(let imageData):
                            DispatchQueue.main.async {
                                ImageCache.shared.setImageData(data: imageData, key: peopleList.avatar)
                                self.newImageView.image = UIImage(data: imageData)
                            }
                case .failure(let error):
                    print(error)
                }
            }
        }
        
        
    }

    override func prepareForReuse() {
        self.FirstNameLabel.text = " name title"
        self.LastNameLabel.text = " type title"
        self.newImageView.image = UIImage(named: "pp")
    }
}

