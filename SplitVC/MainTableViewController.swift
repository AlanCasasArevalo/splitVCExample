//
//  MainTableViewController.swift
//  SplitVC
//
//  Created by Alan Casas on 2/8/17.
//  Copyright © 2017 Alan Casas. All rights reserved.
//

import UIKit


//Creamos un protocolo que sera lo que queremos que suceda en nuestro caso que el delegado sepa quien le manda el objeto y que reciba un nuevo modelo.
protocol MainTableViewControllerDelegate {
    //Enviamos al delegado que va a recibir del controlador un objeto
    func mainTableViewController (mainTableViewController:MainTableViewController, didSelecteModel: Mamiferos )
}

class MainTableViewController: UITableViewController {
    
    //Creamos la variable que hara que se pueda implementar el protocolo en otras clases.
    var mainDelegate : MainTableViewControllerDelegate?
    
    let cellID = "MamiferosCell"
    let model : [Mamiferos]

    init(model: [Mamiferos]) {
        self.model = model
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return model.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let modelToCell = model[indexPath.row]
        
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellID)
        }

        cell?.textLabel?.text = modelToCell.name
        cell?.detailTextLabel?.text = modelToCell.description
        cell?.imageView?.image = modelToCell.image
        
        return cell!
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let modelToVC = model[indexPath.row]
        
//        let detailVC = DetailViewController(model: modelToVC)
//        navigationController?.pushViewController(detailVC, animated: true)
        
        //Implementamos el protocolo creado, haciendo que la tabla con el modelo que se ha seleccionado se mande al delegado, lo que haga el delegado con esa informacion es cosa suya.
        self.mainDelegate?.mainTableViewController(mainTableViewController: self, didSelecteModel: modelToVC)
        
    }
    
}




























