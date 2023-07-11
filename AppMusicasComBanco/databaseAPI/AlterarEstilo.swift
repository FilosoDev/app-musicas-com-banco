//
//  AlterarEstilo.swift
//  AppMusicasComBanco
//
//  Created by Arthur on 11/07/23.
//

import Foundation
import SwiftKuery

func atualizaEstilo() {
    let utils = CommonUtils.sharedInstance
    let musicas = Musicas()
    let bandas = Bandas()
    let albuns = Albuns()
    let estilos = Estilos()
    func imprime() {
        print("""
\("Banda".fill()) \("Música".fill()) Estilo
-------------------- -------------------- ------
--------------
""")
        consulta(Select(bandas.nome, musicas.nome,
                        estilos.nome,
                        from: musicas)
            .join(bandas).on(musicas.idBanda ==
                             bandas.idBanda)
                .join(estilos).on(musicas.idEstilo ==
                                  estilos.idEstilo)
                    .where(musicas.idBanda == 3))
        print("""
\("Álbum".fill()) Estilo
-------------------- --------------------
""")
        consulta(Select(albuns.nome, estilos.nome, from:
                            albuns)
            .join(estilos).on(albuns.idEstilo ==
                              estilos.idEstilo)
                .where(albuns.idBanda == 3))
    }
    imprime()
    print("\n- - - - - - - - - - - - - - - - - - - - - - - - \n")
          utils.executaQuery(Update(musicas, set:
                                        [(musicas.idEstilo, 2)],
                                    where: musicas.idBanda == 3))
          utils.executaQuery(Update(albuns, set:
                                        [(albuns.idEstilo, 2)],
                                    where: albuns.idBanda == 3))
          imprime()
          print()
          }
