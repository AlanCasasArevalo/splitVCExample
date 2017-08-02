//
//  Repository.swift
//  SplitVC
//
//  Created by Alan Casas on 2/8/17.
//  Copyright © 2017 Alan Casas. All rights reserved.
//

import Foundation

final class Repository{
    
    static let local = LocalFactory()
    
}

protocol AnimalFactory {
    
    var mamiferos : [Mamiferos] {get}
    
}

final class LocalFactory : AnimalFactory{
    var mamiferos: [Mamiferos]{
        
        let mono = Mamiferos(name: "Mono", description: "El payaso del reino animal", image: #imageLiteral(resourceName: "chimpance"))
        let tiger = Mamiferos(name: "Tigre", description: "uno de los felinos mas grandes de la tierra", image: #imageLiteral(resourceName: "tigre"))
        let nu = Mamiferos(name: "Ñu", description: "Recorren varios cientos de km en su peregrinage", image: #imageLiteral(resourceName: "Niu"))
        
        return [mono, tiger, nu]
        
    }

    
}










