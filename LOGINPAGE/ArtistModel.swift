//
//  ArtistModel.swift
//  LOGINPAGE
//
//  Created by Vedant Batra on 21/03/19.
//  Copyright © 2019 Vedant Batra. All rights reserved.
//

class ArtistModel {
    
    var id: String?
    var name: String?
    var genre: String?
    
    init(id: String?, name: String?, genre: String?){
        self.id = id
        self.name = name
        self.genre = genre
    }
}
