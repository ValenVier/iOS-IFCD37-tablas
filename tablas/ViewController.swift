//
//  ViewController.swift
//  tablas
//
//  Created by Javier Rodríguez Valentín on 24/09/2021.
//

import UIKit

class ViewController: UIViewController{
    
    var array = ["Valladolid","Palencia","Segovia","Salamanca","Madrid"]
    
    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.dataSource = self //nos mete el UITableViewDataSource que lo metemos en una excepción
        table.delegate = self//nos mete el UITableViewDelegate que lo metemos en una excepción
        
        table.tableFooterView = UIView() //no muestra nada por debajo de la última fila
        
    }
    
}


extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //Las secciones nos hacen la tabla completa (si == 0 una vez, pero si es mayor que 0 más veces) y el resto de secciones que pongamos (en la funcion de secciones) nos lo hace poniendo solo los elementos que digamos en este caso 2
        /*if section == 0 {
            return array.count
        }else{
            return 2
        
        }*/
        
        return array.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = table.dequeueReusableCell(withIdentifier: "celda") //
       
        if cell == nil{
            //si la celda no existe se crea con el método constructor
            cell = UITableViewCell(style: .default, reuseIdentifier: "celda")
            
            //aquí podemos cambiar propiedades de la tabla
            cell?.textLabel?.font = .systemFont(ofSize: 20)
            cell?.accessoryType = .disclosureIndicator //flecha > al final
            cell?.backgroundColor = .cyan
            cell?.tintColor = .red
            
        }
        
        cell?.textLabel!.text = array[indexPath.row]
        return cell!
        
    }
    
}

extension ViewController: UITableViewDelegate{
    //esta función nos dice el elemento seleccionado
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Has seleccionado la fila: \(array[indexPath.row])")
    }
    
    //secciones
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }

}
