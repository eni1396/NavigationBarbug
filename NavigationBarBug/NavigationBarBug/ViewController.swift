//
//  ViewController.swift
//  NavigationBarBug
//
//  Created by Nikita Entin on 08.08.2022.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var goToBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Go to the next screen", for: .normal)
        btn.addTarget(self, action: #selector(goToVC), for: .touchUpInside)
        btn.backgroundColor = .systemPink
        btn.tintColor = .blue
        btn.layer.cornerRadius = 10
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        view.addSubview(goToBtn)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        layoutButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    private func layoutButton() {
        let fixedSize = CGSize(width: 30, height: 30)
        let availableSize = goToBtn.sizeThatFits(fixedSize)
        goToBtn.frame.size = availableSize
        goToBtn.frame.origin = CGPoint(x: view.bounds.midX - goToBtn.frame.width / 2, y: view.frame.height / 2)
    }
    
    @objc private func goToVC() {
        let vc = SearchBarVC()
        navigationController?.modalTransitionStyle = .coverVertical
        navigationController?.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(vc, animated: true)
    }

}

