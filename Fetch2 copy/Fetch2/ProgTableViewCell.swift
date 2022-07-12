//
//  ProgTableViewCell.swift
//  Fetch2
//
//  Created by Consultant on 7/11/22.
//

import UIKit

class ProgTableViewCell: UITableViewCell {

    static let reuseID = "\(ProgTableViewCell.self)"
    
    
    lazy var progImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        return imageView
        
    }()
    
    lazy var progTopLabel: UILabel = {
        let Label = UILabel(frame: .zero)
        Label.translatesAutoresizingMaskIntoConstraints = false
        Label.numberOfLines = 0
        Label.textAlignment = .center
        Label.font = Label.font.withSize(20)
        
        return Label
        
    }()
    
    
    lazy var progMidLabel: UILabel = {
        let Label = UILabel(frame: .zero)
        Label.translatesAutoresizingMaskIntoConstraints = false
        Label.numberOfLines = 0
        Label.textAlignment = .center
        Label.font = Label.font.withSize(15)
        
        return Label
        
    }()
    
    
    
    lazy var progSlider: UISlider = {
        let Slider = UISlider(frame: .zero)
        Slider.translatesAutoresizingMaskIntoConstraints = false
        //Slider.center = self.center
        Slider.setValue(0.5, animated: true)
        
        
        self.progMidLabel.text = "\(Slider.value)"
        Slider.addTarget(self, action: #selector(self.SliderValueChanged(sender:)), for: .valueChanged)
        
        return Slider
    }()
    
    lazy var progButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Reset", for: .normal)
        
        button.setTitleColor(.white, for: .normal)
        button.tintColor = .systemBlue
        button.backgroundColor = .systemCyan
        button.addTarget(self, action: #selector(self.callNetwork), for: .touchUpInside)
        button.addTarget(self, action: #selector(self.progButtonPressed), for: .touchUpInside)
        button.addTarget(self, action: #selector(self.button2), for: .touchUpInside)
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setUpUI(){
        callNetwork()
        self.backgroundColor = .clear
        let vStackView = UIStackView(frame: .zero)
        vStackView.translatesAutoresizingMaskIntoConstraints = false
        vStackView.spacing = 8
        vStackView.axis = .vertical
        vStackView.distribution = .fillEqually
        
        vStackView.addArrangedSubview(self.progTopLabel)
        vStackView.addArrangedSubview(self.progMidLabel)
        vStackView.addArrangedSubview(self.progSlider)
        
        vStackView.addArrangedSubview(self.progButton)
        
        
        let hStackView = UIStackView(frame: .zero)
        hStackView.translatesAutoresizingMaskIntoConstraints = false
        hStackView.spacing = 8
        hStackView.axis = .horizontal
        
        hStackView.addArrangedSubview(self.progImageView)
        hStackView.addArrangedSubview(vStackView)
        
        self.progImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        self.progImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        self.contentView.addSubview(hStackView)
        hStackView.bindToSuperView()
    }
    @objc func SliderValueChanged(sender: UISlider){
         
        progSlider.value = sender.value
         
        progMidLabel.text = "\(sender.value)"
        NSLog("You slide toward value: \(Double(sender.value))!")    }
    
    @objc
    func progButtonPressed() {
        print("Button Was Tapped!!!!")
        progSlider.value = 0.5
        progMidLabel.text = "0.5"
        
    }
    
    
    
//    @objc
//    private func callNetwork(){
//        guard let url = URL(string: "https://picsum.photos/200/300") else{return}
//        let task = URLSession.shared.dataTask(with: url){data, response, error in
////            print(data)
//            //print(response)
//            guard let data = data else{return}
//            DispatchQueue.main.async{
//            self.progImageView.image = UIImage(data: data)
//            //print(error)
//            }}
//            task.resume()
//    }
    
    @objc
    func button2(){
//        if let str = URL(string: "https://picsum.photos/200/300"){
//            let texts = "\(String(describing: URLRequest(url: str).allHTTPHeaderFields?["picsum-id"]))"
//            progTopLabel.text = texts} else {
//                let url = URL(string: "https://picsum.photos/200/300")!
//                let request = URLRequest(url: url)
//                let val = request.allHTTPHeaderFields!["picsum-id"]
//                let str = "\(String(describing: val))"
//                progTopLabel.text = str
//      
    }
    
    @objc
    func callNetwork() {
        let url = URL(string: "https://picsum.photos/200/300")
        
//        self.networkManager.getData(url: url) { data in
//            DispatchQueue.main.async {
//                if let data = data {
//                    self.stockImageView.image = UIImage(data: data)
//                }
//            }
//        }
        
        NetworkManager.shared.getData(url: url) { result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.progImageView.image = UIImage(data: data)
                    
                    
                }
            
            case .failure(let error):
                print(error)
                DispatchQueue.main.async {
                    self.progImageView.image = UIImage(named: "X")
                    
                }
            }
        }
        
    }
   

}
