//
//  MyPlacesTVC.swift
//  MyPlaces
//
//  Created by Dmitry Grinev on 21.10.2020.
//

import UIKit
import RealmSwift

class MyPlacesTVC: UITableViewController {
    
    //    var placesNames = ["Burger Heroes", "Kitchen", "Bonsai", "Дастархан", "Индокитай", "X.O", "Балкан Гриль", "Sherlock Holmes", "Speak Easy",
    //                       "Morris Pub", "Вкусные истории", "Классик", "Love&Life", "Шок", "Бочка"]
    //    var places = [Place(name: "Burger Heroes", location: "Уфа", type: "Ресторан", image: "Burger Heroes")]
    
    var places: Results<Place>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        places = realm.objects(Place.self)
        
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.isEmpty ? 0 : places.count
    }
    //
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "placesCell", for: indexPath) as! CustomTVCell
        
        let place = places[indexPath.row]
        
        cell.nameLabel.text = place.name
        cell.locationLabel.text = place.location
        cell.typeLabel.text = place.type
        cell.imageOfCell.image = UIImage(data: place.imageData!)
        cell.imageOfCell.layer.cornerRadius = cell.imageOfCell.frame.size.height / 2
        cell.imageOfCell.clipsToBounds = true
        
        return cell
    }
    // MARK: - Table view delegate
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
       
        if editingStyle == .delete {
            let place = places[indexPath.row]
            StorageManager.deleteObject(place)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    @IBAction func unwindSegue(_ segue: UIStoryboardSegue){
        
        guard let newPlaceViewContr = segue.source as? NewPlaceVC else { return }
        
        newPlaceViewContr.saveNewPlace()
        tableView.reloadData()
        
    }
}
