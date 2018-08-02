//
//  ViewController.swift
//  selin
//
//  Created by Selin Ersev on 16.07.2018.
//  Copyright © 2018 Selin Ersev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var json : JSON?
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.tableView.separatorStyle = .none
        self.tableView.allowsSelection = false
        self.title = "Ratings & Reviews"
        let jsonUrlString = "https://itunes.apple.com/tr/rss/customerreviews/id=373034841/sortBy=mostRecent/json"
        
        guard let url = URL(string: jsonUrlString) else {return}
        URLSession.shared.dataTask(with: url){(data,response,err) in
            guard let data = data else { return }
            do {
                self.json = try JSONDecoder().decode(JSON.self, from: data)
                
                DispatchQueue.main.async { [weak self] in
                    self?.tableView.reloadData()
                }
            }catch let jsonErr {
                print("Error serializing json:",jsonErr)
            }
            
            }.resume()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        guard let count = self.json?.feed.entry.count else { return 0 }
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        guard let entry =  self.json?.feed.entry[indexPath.row] else { return UITableViewCell()}
        if indexPath.row == 0 {
            let markingTagCell = tableView.dequeueReusableCell(withIdentifier: "markingTagCell", for: indexPath) as! MarkingTagTableViewCell
            markingTagCell.populate(with: entry)
            return markingTagCell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "reviewCell", for: indexPath) as! cTableViewCell
            cell.populate(with: entry)
            return cell
        }
    }
}


extension ViewController: UITableViewDelegate{
    
}



