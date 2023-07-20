//
//  Consultas.swift
//  AppMusicasComBanco
//
//  Created by Arthur on 11/07/23.
//

import Foundation
import SwiftKuery
import SwiftKueryMySQL

public extension String {
    func fill(to: Int = 20) -> String {
        var saida = self
        if self.count < to {
            for _ in 0..<(to - self.count) {
                saida += " "
            }
        }
        return saida
    }
}

func consulta(_ select: Select) {
    let utils = CommonUtils.sharedInstance
    utils.executaConsulta(select) { registros in
        guard let registros = registros else {
            return print("Sem registros")
        }
        registros.forEach { linha in
            linha.forEach { item in
                print("\(item ?? "")".fill(), terminator: " ")
            }
            print()
        }
    }
}



// desenvolvendo as consultas

// Lista todos os álbuns.
func consulta1() {
    let albuns = Albuns()
    consulta(Select(albuns.nome, albuns.ano, from:albuns))
}

// Lista todas as músicas.
func consulta2() {
    let musicas = Musicas()
    consulta(Select(musicas.nome, musicas.idEstilo, from:musicas))
}

// Lista o álbum e as músicas, caso tenha.
// Precisa instanciar antes, até a tabela MusicasDoAlbuns.
// Stay Like This não tem nenhuma música.
func consulta3() {
    let albuns = Albuns()
    let musicas = Musicas()
    let musicasDoAlbum = MusicasDosAlbuns()
    
    consulta(Select(albuns.nome, musicas.nome, from:albuns)
        .leftJoin(musicasDoAlbum)
        .on(albuns.idAlbum == musicasDoAlbum.idAlbum)
        .leftJoin(musicas)
        .on(musicasDoAlbum.idBanda == musicas.idBanda && musicasDoAlbum.idMusica == musicas.idMusica))
}

// Retorna as bandas e a quantidade de músicas,
// caso tenham mais ou igual a 2 músicas.
func consulta4() {
    let musicas = Musicas()
    let bandas = Bandas()
    consulta(Select(bandas.nome, count(musicas.idBanda), from: musicas)
        .join(bandas).on(musicas.idBanda == bandas.idBanda)
            .group(by: musicas.idBanda)
            .having(count(musicas.idBanda) >= 2)
            .order(by: .DESC(count(musicas.idBanda))))
}
