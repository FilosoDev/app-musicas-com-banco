//
//  Database.swift
//  AppMusicasComBanco
//
//  Created by Arthur on 11/07/23.
//

import Foundation
import SwiftKuery

class Bandas: Table {
    let tableName = "Banda"
    let idBanda = Column("idBanda", Int32.self, autoIncrement: true, primaryKey: true, notNull: true)
    let nome = Column("nome", String.self, notNull: true)
}

class Estilos: Table {
    let tableName = "Estilo"
    let idEstilo = Column("idEstilo", Int32.self, autoIncrement: true, primaryKey: true, notNull: true)
    let nome = Column("nome", String.self, notNull: true)
}


class Albuns: Table {
    let tableName = "Albuns"
    let idAlbum = Column("idAlbum", Int32.self, autoIncrement: true, primaryKey: true, notNull: true)
    let nome = Column("nome", String.self, notNull: true)
    let ano = Column("ano", Int32.self, notNull: true)
    let idBanda = Column("idBanda", Int32.self, notNull: true)
    let idEstilo = Column("idEstilo", Int32.self, notNull: true)
}

class Musicas: Table {
    let tableName = "Musica"
    let idBanda = Column("idBanda", Int32.self, notNull: true)
    let idMusica = Column("idMusicas", Int32.self, autoIncrement: true,primaryKey: true, notNull: true)
    let nome = Column("nome", String.self, notNull: true)
    let idEstilo = Column("idEstilo", Int32.self, notNull: true)
}

class MusicasDosAlbuns: Table {
    let tableName = "Musicas_do_Album"
    let idBanda = Column("idBanda", Int32.self, notNull: true)
    let idMusica = Column("idMusica", Int32.self, notNull: true)
    let idAlbum = Column("idAlbum", Int32.self, notNull: true)
}
