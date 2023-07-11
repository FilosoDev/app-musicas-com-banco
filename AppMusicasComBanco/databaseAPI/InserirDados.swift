//
//  InserirDados.swift
//  AppMusicasComBanco
//
//  Created by Arthur on 11/07/23.
//

import Foundation
import SwiftKuery


// Essa classe executa a query de inserção.


func insereDados() {
    
    let utils = CommonUtils.sharedInstance
    
    // Bandas
    let bandas = [
        Banda(idBanda: 1, nome: "Tecnimatic"),
        Banda(idBanda: 2, nome: "Trap"),
        Banda(idBanda: 3, nome: "Alix Perez"),
        Banda(idBanda: 4, nome: "Maduk"),
        Banda(idBanda: 5, nome: "AudioSketch"),
        Banda(idBanda: 6, nome: "The Ghost Inside"),
        Banda(idBanda: 7, nome: "Racionais")
    ]
    utils.executaQuery(Insert(into: Bandas(), rows: bandas.map{ $0.colunas}))
    print("Os registros de Bandas foram inseridos")
    
    // Estilos
    let estilos = [
        Estilo(idEstilo: 1, nome: "Rock"),
        Estilo(idEstilo: 2, nome: "Dance"),
        Estilo(idEstilo: 3, nome: "Drum`n`bass"),
        Estilo(idEstilo: 4, nome: "Jungle")
    ]
    utils.executaQuery(Insert(into: Estilos(), rows: estilos.map{$0.colunas }))
    print("Os registros de Estilos foram inseridos")
    
    // Albuns
    let albuns = [
        Album(idAlbum: 1, nome: "Empty Words", ano: 2021,banda: bandas[2], estilo: estilos[3]),
        Album(idAlbum: 2, nome: "Simplicity", ano: 2021,banda: bandas[4], estilo: estilos[1]),
        Album(idAlbum: 3, nome: "Rise from the Ashe", ano: 2021, banda: bandas[5], estilo: estilos[0]),
        Album(idAlbum: 4, nome: "Stay Like This", ano: 2021, banda: bandas[3], estilo: estilos[0]),
        Album(idAlbum: 5, nome: "Walk to you", ano: 2021, banda: bandas[0], estilo: estilos[2]),
        Album(idAlbum: 6, nome: "Above it All", ano: 2021, banda: bandas[1], estilo: estilos[0])
    ]
    utils.executaQuery(Insert(into: Albuns(), rows: albuns.map{ $0.colunas }))
    print("Os registros de \(Albuns().nameInQuery) foram inseridos")
    
    // Musicas
    let musicas = [
        Musica(idMusica: 1, nome: "Above it All",
               estilo: estilos[0], banda: bandas[1],
               album: albuns[5]),
        Musica(idMusica: 2, nome: "Avalanche",
               estilo: estilos[0], banda: bandas[5],
               album: albuns[2]),
        Musica(idMusica: 3, nome: "Between the Lines",
               estilo: estilos[0], banda: bandas[5],
               album: albuns[2]),
        Musica(idMusica: 4, nome: "Burning Babylon",
               estilo: estilos[3], banda: bandas[2],
               album: albuns[0]),
        Musica(idMusica: 5, nome: "Dear Youth",
               estilo: estilos[0], banda: bandas[5],
               album: albuns[2]),
        Musica(idMusica: 6, nome: "Devotion",
               estilo: estilos[1], banda: bandas[4],
               album: albuns[1]),
        Musica(idMusica: 7, nome: "Empty Words",
               estilo: estilos[3], banda: bandas[2],
               album: albuns[0]),
        Musica(idMusica: 8, nome: "Everlasting",
               estilo: estilos[2], banda: bandas[0],
               album: albuns[4]),
        Musica(idMusica: 9, nome: "Greater Distance",
               estilo: estilos[0], banda: bandas[5],
               album: albuns[2])
    ]
    utils.executaQuery(Insert(into: Musicas(), rows: musicas.map{ $0.colunas }))
    print("Os registros de Musicas foram inseridos")
    utils.executaQuery(Insert(into: MusicasDosAlbuns(), rows: musicas.map{ $0.join }))
    print("Os registros de Musicas dos Albuns foram   inseridos")
    }
