//
//  ViewController.swift
//  PeopleApp
//
//  Created by Megha Uppin on 09/11/2022.
//

import UIKit

class ViewController: UIViewController {

    lazy var peopleButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("People", for: .normal)
        button.backgroundColor = .systemPink

        button.addTarget(self, action: #selector(peopleButtonPressed), for: .touchUpInside)
        return button
    }()

    lazy var roomButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Room", for: .normal)
        button.backgroundColor = .systemPink

        button.addTarget(self, action: #selector(roomButtonPressed), for: .touchUpInside)
        return button
    }()



    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemTeal
        self.setupUI()

    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        peopleButton.center = view.center

    }

    private func setupUI() {
        self.view.addSubview(peopleButton)
        self.view.addSubview(roomButton)

        self.peopleButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        self.peopleButton.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 15).isActive = true
        self.peopleButton.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -15).isActive = true

        self.roomButton.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 15).isActive = true
        self.roomButton.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -15).isActive = true
        self.roomButton.topAnchor.constraint(equalTo: self.peopleButton.bottomAnchor, constant: 20).isActive = true

    }


    @objc
    func peopleButtonPressed() {
        let peopleVC = PeopleViewController()
        peopleVC.title = "People PAGE"
        self.navigationController?.pushViewController(peopleVC, animated: true)
    }

    @objc
    func roomButtonPressed() {
        let roomVC = RoomViewController()
        self.navigationController?.pushViewController(roomVC, animated: true)
    }



}




