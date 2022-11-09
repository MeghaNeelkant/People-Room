//
//  RoomViewController.swift
//  PeopleApp
//
//  Created by Megha Uppin on 09/11/2022.
//

import UIKit

class RoomViewController: UIViewController {
    
    var allRoom: [RoomData] = []
   
    
    lazy var roomTable: UITableView = {
        let table = UITableView(frame: .zero)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .systemPink
        table.dataSource = self
//        table.delegate = self
//        table.prefetchDataSource = self
       table.register(RoomViewCell.self, forCellReuseIdentifier: RoomViewCell.reuseID)
        return table
    }()
    
    let network: NetworkManager = NetworkManager()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpUI()
        self.requestPage()
        
        // Do any additional setup after loading the view.
    }

    private func setUpUI(){
        self.view.backgroundColor = .clear
        self.title = "Rooms"
        self.view.addSubview(self.roomTable)
        self.roomTable.bindToSuperView()
       
    }
    
    private func requestPage(){
        self.network.fetchRoomData(urlStr :"https://61e947967bc0550017bc61bf.mockapi.io/api/v1/rooms"){ result in
            switch result {
            case.success(let Page):
            print(Page)
                self.allRoom.append(contentsOf: Page )
                
                DispatchQueue.main.async {
                    self.roomTable.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
      
    }
}

extension RoomViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.allRoom.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RoomViewCell.reuseID, for: indexPath) as? RoomViewCell else {
          
            return UITableViewCell()
        }
        
        cell.configure(roomList: allRoom[indexPath.row], network: self.network)
        
        return cell
    }
    
}

extension RoomViewController: UITableViewDelegate {
    
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        }
}


    
    



                                                                    

