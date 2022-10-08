//
//  ViewController.swift
//  Random Photo App
//
//  Created by The Night Owl Dev on 10/7/22.
//

import UIKit

class ViewController: UIViewController {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
        
        return imageView
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Random Photo", for: .normal)
        button.setTitleColor(.systemPink, for: .normal)
        return button
    }()
    
    let colors: [UIColor] = [
        .systemMint,
        .systemPink,
        .yellow,
        .purple,
        .systemGreen,
        .systemOrange
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemMint
        view.addSubview(imageView)
        
        imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        imageView.center = view.center
        
        view.addSubview(button)
        button.frame = CGRect(
            x: 30,
            y: view.frame.size.height-200-view.safeAreaInsets.bottom,
            width: view.frame.width-60,
            height: 60)
        
        getRandomPhoto()
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    @objc func didTapButton() {
        getRandomPhoto()
        getRandomColor()
    }
    
    func getRandomColor() {
        view.backgroundColor = colors.randomElement()
    }

    func getRandomPhoto() {
        let urlString = "https://source.unsplash.com/random/600x600"
        let url = URL(string: urlString)!
        guard let data = try? Data(contentsOf: url) else {
            return
        }
        imageView.image = UIImage(data: data)
    }
}

