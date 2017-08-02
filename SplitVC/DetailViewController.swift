//
//  DetailViewController.swift
//  SplitVC
//
//  Created by Alan Casas on 2/8/17.
//  Copyright © 2017 Alan Casas. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UISplitViewControllerDelegate {
    
    let mamiferos = Repository.local.mamiferos
    
    @IBOutlet weak var imageDetail: UIImageView!

    @IBOutlet weak var nameLabelDetail: UILabel!
    
    @IBOutlet weak var descriptionLabelDetail: UILabel!
    
    let model : Mamiferos
    
    init(model:Mamiferos) {
        self.model = model
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        syncModelWithView()
        
    }
    
    func syncModelWithView(){
        
        imageDetail.image = model.image
        nameLabelDetail.text = model.name
        descriptionLabelDetail.text = model.description
        
    }
    
    func displayAnimales() {
        let animalesVC = MainTableViewController(model: mamiferos)
        navigationController?.pushViewController(animalesVC, animated: true)
    }
    
    func splitViewController(_ svc: UISplitViewController, willChangeTo displayMode: UISplitViewControllerDisplayMode) {
        
        if self.splitViewController?.displayMode == UISplitViewControllerDisplayMode.primaryHidden{
            self.navigationItem.rightBarButtonItem = self.splitViewController?.displayModeButtonItem
        }
        
    }
}


















