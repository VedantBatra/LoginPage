//
//  newViewController.swift
//  LOGINPAGE
//
//  Created by Vedant Batra on 11/03/19.
//  Copyright © 2019 Vedant Batra. All rights reserved.
//

import UIKit
import Toast_Swift
import Firebase
import FirebaseAuth
var username = ""
//import FirebaseDatabase
class newViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    
    
    
    var refArtists:DatabaseReference!

    @IBOutlet weak var textfieldname: UITextField!
    @IBOutlet weak var textfieldgenre: UITextField!
    @IBOutlet weak var tableArtist: UITableView!
    
    var artistList = [ArtistModel]()
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return artistList.count
    }
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        //creating a cell using the custom class
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ViewControllerTableViewCell
        
        //the artist object
        let artist: ArtistModel
        
        //getting the artist of selected position
        artist = artistList[indexPath.row]
        
        //adding values to labels
        cell.lblName.text = artist.name
        cell.lblGenre.text = artist.genre
        
        //returning cell
        return cell
    }
    
    
    @IBOutlet weak var Labelmessage: UILabel!
    @IBAction func addartistgenre(_ sender: UIButton) {
        addArtists()
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.makeToast("Loggedin successfully")
        // Do any additional setup after loading the view.
        refArtists = Database.database().reference().child("artists");
        refArtists.observe(DataEventType.value, with: { (snapshot) in
            if snapshot.childrenCount > 0 {
                
                //clearing the list
                self.artistList.removeAll()
                
                //iterating through all the values
                for artists in snapshot.children.allObjects as! [DataSnapshot] {
                    //getting values
                    let artistObject = artists.value as? [String: AnyObject]
                    let artistName  = artistObject?["artistName"]
                    let artistId  = artistObject?["id"]
                    let artistGenre = artistObject?["artistGenre"]
                    
                    let artist = ArtistModel(id: artistId as! String?, name: artistName as! String?, genre: artistGenre as! String?)
                    
                    self.artistList.append(artist)
                    
                }
                self.tableViewArtists.reloadData();            print(error.localizedDescription)
        }
    })
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Vedant"
        return cell
    }
    func addArtists(){
    
    let key = refArtists.childByAutoId().key
    
    
    let artist = ["id":key,
                  "artistName": textfieldname.text! as String,
                  "artistGenre": textfieldgenre.text! as String]
        refArtists.child(key!).setValue(artist)
        Labelmessage.text = "Artist Added"

    }
    
    @IBAction func log(_ sender: UIButton) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            let homeview = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
            self.present(homeview,animated: true, completion: nil)
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
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

}
