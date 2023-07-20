//
//  Model.swift
//  AppMusicasComBanco
//
//  Created by Arthur on 16/07/23.
//

import Foundation

struct Banda {
    var idBanda: Int
    var nome: String
    var colunas: [Any] { [ idBanda, nome ] }
}

struct Album {
    var idAlbum: Int
    var nome: String
    var ano: Int
    var banda: Banda
    var estilo: Estilo
    var colunas: [Any] { [ idAlbum, nome, ano, banda.idBanda, estilo.idEstilo ] }
}

struct Estilo {
    var idEstilo: Int
    var nome: String
    var colunas: [Any] {[ idEstilo, nome ]}
}

struct Musica {
    var idMusica: Int
    var nome : String
    var estilo : Estilo
    var banda : Banda
    var album : Album
    var colunas : [Any] {[ banda.idBanda, idMusica, nome, estilo.idEstilo ]}
    var join: [Any] {[ banda.idBanda, idMusica, album.idAlbum ]}
}
