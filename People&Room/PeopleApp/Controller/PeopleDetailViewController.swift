//
//  PeopleDetailViewController.swift
//  PeopleApp
//
//  Created by Megha Uppin on 07/09/2022.
//

import UIKit

class PeopleDetailViewController: UIViewController {
    
    var allPeople: [PeopleData] = []
    
    
    lazy var topImageView : UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .systemGray
        return imageView
    }()

    lazy var FirstNameLabel : UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "FirstName"
        label.backgroundColor = .cyan
        return label
    }()
    
    lazy var LastNameLabel : UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "LastName"
        label.backgroundColor = .cyan
        return label
    }()
    
    lazy var EmailLabel : UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "Email"
        label.backgroundColor = .cyan
        return label
    }()
    
    
    lazy var JobTitleLabel : UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "JobTitle"
        label.backgroundColor = .cyan
        return label
    }()
    
    
    let network: NetworkManager = NetworkManager()
    
    var people : PeopleData?
//    var allPeople: People?
    
    var pagesUrl: results?
    
    init(allPeople: PeopleData){
        self.allPeople = [allPeople]
        print(self.allPeople)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .systemPurple
        
    }
    
    }
