//
//  SearchFoodViewController.swift
//  foodApp
//
//  Created by Juan Camilo on 6/12/20.
//

import UIKit

class SearchFoodViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
        }
    }
    
    var coordinator: MainCoordinator?
    var defaultHeight = 200
    
    var headerView: HeaderView = {
        let nib = UINib(nibName: "HeaderView", bundle: nil)
        return nib.instantiate(withOwner: self, options: nil).first as! HeaderView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .lightGray
    }
    
    override func viewSafeAreaInsetsDidChange() {
        super.viewSafeAreaInsetsDidChange()

        tableView.contentInset = UIEdgeInsets(top: 250 + tableView.safeAreaInsets.top, left: 0,  bottom: 0,
                                              right: 0)
        headerView.updatePosition()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        headerView.updatePosition()
    }
}

extension SearchFoodViewController {
    func setupView() {
        headerView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        headerView.scrollView = tableView
        headerView.frame = CGRect(x: 0, y: tableView.safeAreaInsets.top, width: view.frame.width, height: 250)
        
        tableView.backgroundView = UIView()
        tableView.backgroundView?.addSubview(headerView)
        tableView.contentInset = UIEdgeInsets(top: 250,left: 0, bottom: 0, right: 0)
    }
}

extension SearchFoodViewController: UITableViewDelegate {
    func scrollViewDidScrollToTop(_ scrollView: UIScrollView) {
        headerView.updatePosition()
    }
}
