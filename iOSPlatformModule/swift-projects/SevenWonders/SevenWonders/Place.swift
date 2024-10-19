//
//  Place.swift
//  SevenWonders
//
//  Created by Renata Albuquerque on 19/10/24.
//

import Foundation

struct Place : Identifiable {
    var id = UUID()
    var name : String
    var img : String
    var desc : String
}


var places : [Place] = [
    Place(name: "Cristo Redentor", img: "https://www.civitatis.com/blog/wp-content/uploads/2024/04/shutterstock_45681094-1280x962.jpg", desc: "Localizada no topo do Morro do Corcovado, no Rio de Janeiro, esta icônica estátua retrata Jesus Cristo com os braços abertos em um gesto de boas-vindas e proteção. É uma figura de 38 metros de altura construída entre 1922 e 1931 em concreto armado e pedra-sabão."),
    Place(name: "A Grande Muralha da China", img: "https://www.civitatis.com/blog/wp-content/uploads/2024/04/shutterstock_1092919118-1280x960.jpg", desc: "A Grande Muralha da China é uma impressionante estrutura de defesa que se estende por milhares de quilômetros através do território chinês, testemunhando a engenhosidade e o trabalho árduo de gerações de construtores."),
    Place(name: "Machu Picchu", img: "https://s3.static.brasilescola.uol.com.br/be/2024/05/machu-picchu.jpg", desc: "Machu Picchu é uma antiga cidade inca, situada no topo de uma montanha nos Andes, um exemplo notável da arquitetura e da engenharia inca, além de ser um importante sítio arqueológico e um destino turístico popular."),
    Place(name: "Petra", img: "https://www.civitatis.com/blog/wp-content/uploads/2024/04/shutterstock_1030695895-1280x853.jpg", desc: "Petra é uma antiga cidade esculpida em rocha, situada entre as montanhas do deserto jordaniano, conhecida por seus edifícios e túmulos esculpidos nas encostas das montanhas."),
    Place(name: "Coliseu de Roma", img: "https://www.civitatis.com/blog/wp-content/uploads/2024/04/shutterstock_301179038-1280x782.jpg", desc: "Um dos símbolos mais reconhecíveis de Roma, o Coliseu é um antigo anfiteatro onde ocorriam espetáculos de gladiadores e outras formas de entretenimento na Roma Antiga."),
    Place(name: "Taj Mahal", img: "https://www.civitatis.com/blog/wp-content/uploads/2024/04/shutterstock_2387591325-1280x853.jpg", desc: "O Taj Mahal é um magnífico mausoléu de mármore branco, construído pelo imperador mongol Shah Jahan em memória de sua esposa Mumtaz Mahal; é uma das maravilhas arquitetônicas mais famosas do mundo."),
    Place(name: "Chichén Itzá", img: "https://www.civitatis.com/blog/wp-content/uploads/2024/04/shutterstock_2307055235-1280x855.jpg", desc: "Chichén Itzá é um complexo de ruínas maias na Península de Yucatán conhecido por sua pirâmide escalonada, chamada de El Castillo, e por seus templos e observatórios astronômicos, representando o esplendor da civilização maia."),
]
