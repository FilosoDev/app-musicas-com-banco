//
//  CriarTabelas.swift
//  AppMusicasComBanco
//
//  Created by Arthur on 11/07/23.
//

import Foundation
import SwiftKuery

func criaTabela(){
    let utils = CommonUtils.sharedInstance
    
    let bandas = Bandas()
    utils.criaTabela(bandas)
    print("Tabela Banda Criada")
    
    let estilos = Estilos()
    utils.criaTabela(estilos)
    print("Tabela Estilo Criada")
    
    let albuns = Albuns()
    _ = albuns.foreignKey(albuns.idBanda, references: bandas.idBanda)
    _ = albuns.foreignKey(albuns.idEstilo, references: estilos.idEstilo)
    utils.criaTabela(albuns)
    print("Tabela Album criada")
    
    let musicas = Musicas()
    _ = musicas.foreignKey(musicas.idBanda, references: bandas.idBanda)
    _ = musicas.foreignKey(musicas.idEstilo, references: estilos.idEstilo)
    utils.criaTabela(musicas)
    print("Tabela Musica criada")
    
    let musicasDosAlbuns = MusicasDosAlbuns()
    _ = musicasDosAlbuns.primaryKey(musicasDosAlbuns.idBanda, musicasDosAlbuns.idMusica, musicasDosAlbuns.idAlbum)
    _ = musicasDosAlbuns.foreignKey([musicasDosAlbuns.idBanda, musicasDosAlbuns.idMusica],references: [musicas.idBanda,musicas.idMusica])
    _ = musicasDosAlbuns.foreignKey(musicasDosAlbuns.idAlbum, references: albuns.idAlbum)
    utils.criaTabela(musicasDosAlbuns)
    
    print("Tabela Musicas do Album criada")
}
