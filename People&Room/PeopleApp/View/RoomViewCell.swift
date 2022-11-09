//
//  RoomViewCell.swift
//  PeopleApp
//
//  Created by Megha Uppin on 09/11/2022.
//

import UIKit

class RoomViewCell: UITableViewCell {

    var allRoom: RoomData?
    
    static let reuseID = "\(RoomViewCell.self)"

    lazy var idLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "Id Label"
        label.setContentHuggingPriority(.required, for: .vertical)
        label.setContentCompressionResistancePriority(.required, for: .vertical)
        label.backgroundColor = .systemPurple
        return label
    }()

//    lazy var occupiedLabel: UILabel = {
//        let label = UILabel(frame: .zero)
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.numberOfLines = 0
//        label.text = "occupied Label"
//        label.setContentHuggingPriority(.required, for: .vertical)
//        label.setContentCompressionResistancePriority(.required, for: .vertical)
//        label.backgroundColor = .systemPurple
//        return label
//    }()
//
//    lazy var maxOccupancyLabel: UILabel = {
//        let label = UILabel(frame: .zero)
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.numberOfLines = 0
//        label.text = "Max Occupancy"
//        label.backgroundColor = .systemOrange
//        return label
//    }()

    lazy var createdAtLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "Created At"
        label.backgroundColor = .systemOrange
        return label
    }()


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

        vStack.addArrangedSubview(self.idLabel)
//        vStack.addArrangedSubview(self.occupiedLabel)
//        vStack.addArrangedSubview(self.maxOccupancyLabel)
        hStack.addArrangedSubview(self.createdAtLabel)
        hStack.addArrangedSubview(vStack)

        self.contentView.addSubview(hStack)

        hStack.bindToSuperView()
    }
    
    public func configure(roomList: RoomData, network: NetworkManager) {
        
        self.allRoom = roomList
        
        idLabel.text = "\(self.allRoom?.id ?? "idLabel")"
//       occupiedLabel.text = "\(self.allRoom?.isOccupied ?? "isOccupied")"
//       maxOccupancyLabel.text = "\(self.allRoom?.maxOccupancy ?? "isOccupied")"
        createdAtLabel.text = "\(self.allRoom?.createdAt ?? "isOccupied")"

        func prepareForReuse() {
            idLabel.text = ""
//            occupiedLabel.text = ""
//            maxOccupancyLabel.text = ""
            createdAtLabel.text = ""
        }
}
}
