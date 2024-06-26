//
//  FavoriteViewController.swift
//  Ozinshe_SnapKit
//
//  Created by Диас Нургалиев on 08.04.2024.
//

import UIKit
import SnapKit

class FavoriteViewController: UIViewController {
    let divider = SeparatorView()
    
    lazy var tableView: UITableView = {
        let tv = UITableView()
        
        tv.delegate = self
         tv.dataSource = self
        
        return tv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        view.backgroundColor = .systemBackground
        // Do any additional setup after loading the view.
    }
    func setupUI() {
        view.addSubview(tableView)
        view.addSubview(divider)
        navigationItem.title = "Favorites"
        divider.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.horizontalEdges.equalToSuperview()
        }
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
            make.horizontalEdges.equalToSuperview().inset(24)
        }
    }
}

//      MARK: TableView
extension FavoriteViewController:UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = MovieTableViewCell()
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 152.0
    }
}
