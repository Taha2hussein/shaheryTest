//
//  ListDetailsView.swift
//  viperTest
//
//  Created by A on 07/11/2021.
//

import UIKit
import SDWebImage
class ListDetailsView: UIViewController,UIScrollViewDelegate {
    
    // MARK: - VIPER Stack
    var presenter: ListDetailsViewToPresenterProtocol!
    
    // MARK: - IBOutLets
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var productCatogry: UILabel!
    @IBOutlet weak var imageHeight: NSLayoutConstraint!
    @IBOutlet weak var mainScrollView: UIScrollView!
    
    // MARK: - Instance Variables
    let headerViewMaxHeight: CGFloat = 200
    let headerViewMinHeight: CGFloat = 44 + UIApplication.shared.statusBarFrame.height

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        mainScrollView.delegate = self
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {

        let yPos = mainScrollView.contentOffset.y
        let newHeaderViewHeight: CGFloat = imageHeight.constant - yPos

        if newHeaderViewHeight > headerViewMaxHeight {
            // Here, Manage Your Score Format View
            imageHeight.constant = max(headerViewMaxHeight, headerViewMinHeight)

        } else if newHeaderViewHeight < headerViewMinHeight {

            imageHeight.constant = headerViewMinHeight

        } else {

            imageHeight.constant = newHeaderViewHeight
            scrollView.contentOffset.y = 0 // block scroll view

        }
    }
}

// MARK: - Presenter to View Protocol
extension ListDetailsView: ListDetailsPresenterToViewProtocol {
    func showProduct(product: ListEntity?) {

        self.productPrice.text = "\(product?.price)"
        self.productTitle.text = product?.title
        self.productCatogry.text = product?.category
        setImage(product?.image ?? "")
    }
    
    func setImage( _ image:String) {
        productImage.sd_setImage(with: URL(string: image), placeholderImage: UIImage(named: ""))

    }
    
}
