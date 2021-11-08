//
//  ListViewController.swift
//  viperTest
//
//  Created by A on 07/11/2021.
//

import UIKit
import SkeletonView

class ListView: UIViewController {
    
    // MARK: - VIPER Stack
    var presenter: ListViewToPresenterProtocol!
    
    // MARK: - IBOutLets
    @IBOutlet weak var ProductTableView: UITableView!
    
    // MARK: - Instance Variables
    var currentPage : Int = 5
    var isLoading = false
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setUp()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        requestProducts()
    }
    
    func setUp(){
        ProductTableView.isSkeletonable = true
        ProductTableView.showSkeleton(usingColor: .concrete, transition: .crossDissolve(0.25))
    }
    
    func requestProducts(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 5, execute: {
            self.presenter.requestProducts(limit: self.currentPage)
            self.isLoading = false
        })
    }
    
    deinit {
        print("Login view has been deintialozed")
    }
}

// MARK: - Presenter to View Protocol
extension ListView: ListPresenterToViewProtocol {
    
    func reloadTableView() {
        DispatchQueue.main.async {
            self.ProductTableView.reloadData()
        }
    }
    
    func showProductLoader() {
        
    }
    
    func hideProductLoader() {
        self.ProductTableView.stopSkeletonAnimation()
        self.view.hideSkeleton(reloadDataAfter: true, transition: .crossDissolve(0.25))
    }
    
    func showMessage(message:String) {
        AlertWrapper().showFail(message: message)
    }
    
}

extension ListView: UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return presenter.getProductListCount() ?? currentPage
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(ListTableViewCell.self, for: indexPath)
        presenter.cellProductItem(indexPath: indexPath, cell: cell)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let itemSelected = presenter.getProductSelected(indexPath: indexPath)
        guard let itemSelected = itemSelected as? ListEntity  else{return}
        presenter.showListViewDetailsAction(itemSelected: itemSelected)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if (((scrollView.contentOffset.y + scrollView.frame.size.height) > scrollView.contentSize.height ) && !isLoading){
            self.isLoading = true
            ProductTableView.tableFooterView?.isHidden = true
            currentPage +=  5
            self.requestProducts()
        }
    }
    
}

extension ListView:SkeletonTableViewDelegate{
    
}
