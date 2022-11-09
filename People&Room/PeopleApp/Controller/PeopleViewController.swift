//
//  ViewController.swift
//  PeopleApp
//
//  Created by Megha Uppin on 09/11/2022.
//

import UIKit

class PeopleViewController: UIViewController {
    
    var allPeople: [PeopleData] = []

    lazy var peopleTable: UITableView = {
        let table = UITableView(frame: .zero)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .systemPink
        table.dataSource = self
       table.register(PeopleViewCell.self, forCellReuseIdentifier: PeopleViewCell.reuseID)
        return table
    }()
    
    let network: NetworkManager = NetworkManager()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpUI()
        self.requestPage()
        
    }

    private func setUpUI(){
        self.view.backgroundColor = .clear
        self.title = "People"
        self.view.addSubview(self.peopleTable)
        self.peopleTable.bindToSuperView()
    }
    
    private func requestPage(){
        self.network.fetchPage(urlStr : "https://61e947967bc0550017bc61bf.mockapi.io/api/v1/people"){ result in
            switch result {
            case.success(let Page):
            print(Page)
                self.allPeople.append(contentsOf: Page )
                
                DispatchQueue.main.async {
                    self.peopleTable.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
      
    }
}

extension PeopleViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.allPeople.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PeopleViewCell.reuseID, for: indexPath) as? PeopleViewCell else {
          
            return UITableViewCell()
        }
        
        cell.configure(peopleList: allPeople[indexPath.row], network: self.network)
        
        return cell
    }
}

extension PeopleViewController: UITableViewDelegate {
    
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let peopledetailVC = PeopleDetailViewController(allPeople: allPeople[indexPath.row])
//        self.navigationController?.pushViewController(peopledetailVC, animated: true)
        }
}





    



                                                                    
