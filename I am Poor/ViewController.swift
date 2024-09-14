//
//  ViewController.swift
//  I am Poor
//
//  Created by Bakgeldi Alkhabay on 13.09.2024.
//

import UIKit

class ViewController: UIViewController {

    let label = UILabel()
    let imageView = UIImageView()
    let rollButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        setupView()
    }
    
    private func setupView() {
        
        view.backgroundColor = hexStringToUIColor(hex: "#FFBE98")
        
        //Label
        label.text = "I Am Poor"
        label.font = UIFont.systemFont(ofSize: 35, weight: .bold)
        label.textColor = hexStringToUIColor(hex: "#125B9A`")
        
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        
        //ImageView
        imageView.image = UIImage(named: "coal")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        
        //Button
        rollButton.setTitle("Roll", for: .normal)
        rollButton.setTitleColor(.white, for: .normal)
        rollButton.titleLabel?.font = UIFont.systemFont(ofSize: 25, weight: .medium)
        rollButton.layer.cornerRadius = 12
        rollButton.backgroundColor = hexStringToUIColor(hex: "#A02334")
        rollButton.addTarget(self, action: #selector(rollButtonPressed), for: .touchUpInside)
        rollButton.translatesAutoresizingMaskIntoConstraints = false
        imageView.addSubview(rollButton)
        
        NSLayoutConstraint.activate([
            //Label
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.heightAnchor.constraint(equalToConstant: 30),
            
            //ImageView
            imageView.heightAnchor.constraint(equalToConstant: 270),
            imageView.widthAnchor.constraint(equalToConstant: 270),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            //Button
            rollButton.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 50),
            rollButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            rollButton.heightAnchor.constraint(equalToConstant: 60),
            rollButton.widthAnchor.constraint(equalToConstant: 80),
        ])
    }
    
    @objc func rollButtonPressed() {
        print("Button Pressed!")
    }

    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
}

