//
//  ViewController.swift
//  RXMis
//
//  Created by 杨洋 on 2021/8/3
//

import UIKit
class ViewController: UIViewController {


    @objc func injected(){
        setUpUI()
    }
    func setUpUI() {
        view.backgroundColor = .brown
    
        
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fill

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stackView.addArrangedSubview(label1)
        stackView.addArrangedSubview(label2)
        stackView.addArrangedSubview(label3)
        view.addSubview(stackView)
        self.view = view
        setUpUI()

        
    }
    
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
//        stack.frame.size = CGSize(width: 50, height: 100)
        stack.frame = view.frame
//        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var label1: UIView = {
        let label = UIView()
        label.backgroundColor = UIColor.yellow
//        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.widthAnchor.constraint(equalToConstant: 40),
            label.heightAnchor.constraint(equalToConstant: 100),
                    ])
        return label
    }()
    
    lazy var label2: UIView = {
        let label = UIView()
        label.backgroundColor = UIColor.red
        NSLayoutConstraint.activate([
            label.widthAnchor.constraint(equalToConstant: 80),
            label.heightAnchor.constraint(equalToConstant: 80),
                    ])
        return label
    }()
    
    lazy var label3: UIView = {
        let label = UIView()
        label.backgroundColor = UIColor.blue
        NSLayoutConstraint.activate([
            label.widthAnchor.constraint(equalToConstant: 120),
            label.heightAnchor.constraint(equalToConstant: 60),
                    ])
        return label
    }()
    
    
    
}
