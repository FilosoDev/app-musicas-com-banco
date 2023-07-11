//
//  RemoveTabelas.swift
//  AppMusicasComBanco
//
//  Created by Arthur on 11/07/23.
//

import Foundation

import SwiftKuery


func removeTabelas() {
    
    let utils = CommonUtils.sharedInstance
    
    
    for tabela in [
        
        MusicasDosAlbuns(),
        
        Musicas(),
        
        Albuns(),
        
        Estilos(),
        
        Bandas()
        
    ]{
        
        print("Apagando \(tabela.nameInQuery)")
        
        utils.removeTabela(tabela)
        
    }
    
    
    print("Todas as tabelas foram removidas")
    
}
