//
//  MainViewController.swift
//  Fetch2
//
//  Created by Consultant on 7/11/22.
//

import UIKit

class MainViewController: UIViewController {

    //    var sliderValue = 0
        
        
        
        lazy var table: UITableView = {
            let table = UITableView(frame: .zero)
            table.translatesAutoresizingMaskIntoConstraints = false
            table.backgroundColor = .systemCyan
            table.dataSource = self
            //table.delegate = self
            table.register(ProgTableViewCell.self, forCellReuseIdentifier: ProgTableViewCell.reuseID )
            return table
        }()
        override func viewDidLoad() {
            super.viewDidLoad()
            setUpUI()
            
            
           
            
            
            // Do any additional setup after loading the view.
        }
        
        private func setUpUI(){
            self.view.addSubview(self.table)
            self.table.bindToSuperView()
            
        }
    
    
        

        /*
        // MARK: - Navigation

        // In a storyboard-based application, you will often want to do a little preparation before navigation
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            // Get the new view controller using segue.destination.
            // Pass the selected object to the new view controller.
        }
        */

    }

    extension MainViewController: UITableViewDataSource{
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ProgTableViewCell.reuseID, for: indexPath) as? ProgTableViewCell else{
                return UITableViewCell()
            }
            
            cell.progTopLabel.text = "Image"
            
            //will make label text result of print respones on call network instead
            
            cell.progMidLabel.text = cell.progMidLabel.text
//            cell.progImageView.image = UIImage(named:"Mean_\(indexPath.row)")
            //cell.progSlider = UISlider( in: 0...0)
            
            
            
            return cell
            
        }
        
        
        func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            
            
            
            
            return "sections \(section)"
        
        }
        
        
        func numberOfSections(in tableView: UITableView) -> Int {
            return 1
            
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 10
        }
    }

//    extension MainViewController: UITableViewDelegate{
//        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//            let detailVc = DetailViewController()
//            self.navigationController?.pushViewController(detailVc, animated: true)
//            detailVc.indexP = indexPath.row
//        }}


