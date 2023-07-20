//
//  RemoverRegistro.swift
//  AppMusicasComBanco
//
//  Created by Arthur on 11/07/23.
//

import Foundation

import SwiftKuery


func removeRegistro() {
    
    let utils = CommonUtils.sharedInstance
    
    let albuns = Albuns()
    
    consulta1()
    
    print("\n- - - - - - - - - - - - - - - - - - - - - - - - \n")
    
    utils.executaQuery(Delete(from: albuns).where(albuns.nome == "Stay Like This"))
    
    consulta1()
    
}
