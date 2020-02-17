//
//  Repository.swift
//  TesteArenaFelipePerius
//
//  Created by Felipe perius on 17/02/20.
//  Copyright © 2020 Felipe Perius. All rights reserved.
//

import  ObjectMapper
//Nome do repositório, Descrição do Repositório, Nome / Foto do autor, Número de Stars, Número de Forks
class Repository: Mappable {
    var id: Int?
    var name:String?
    var fullName:String?
    var error:String?
    var description:String?
    var forksCount:Int?
    var starsCount:Int?
    var owner:Owner?
    
    required init?(map: Map) {
    
    }
    
    func mapping(map: Map) {
        name <- map["name"]
        fullName <- map["full_name"]
        description <- map["description"]
        forksCount <- map["forks_count"]
        starsCount <- map["stargazers_count"]
        error <- map["error"]
        owner <- map["owner"]
    }
}
