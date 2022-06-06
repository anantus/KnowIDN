//
//  DataFactory.swift
//  KnowIDN
//
//  Created by Maheswara Ananta Argono on 20/04/22.
//
// kategori,entity,provinsi,kabupaten/kota

import Foundation

// CSV Data taken from https://gitlab.com/putrahadisyah/skripsi/-/blob/master/collection_final_indonesia.csv

struct Culture : Identifiable {
    var kategori : String = ""
    var entity : String = ""
    var provinsi : String = ""
    var kabupaten : String = ""
    var id = UUID()
    
    init(raw: [String]) {
        kategori = raw[1].capitalized
        entity = raw[2].capitalized
        provinsi = raw[4].capitalized
        kabupaten = String(raw[5].capitalized.dropLast())
    }
}

func loadCSV(from csvName : String) -> [Culture] {
    var csvToStruct = [Culture]()
    
    
    //locate csv file
    guard let filePath = Bundle.main.path(forResource: csvName, ofType: "csv") else {
        return []
    }
    
    //convert the contents of the file into one very long string
    var data = ""
    do {
        data = try String(contentsOfFile: filePath)
    } catch{
        print(error)
        return[]
    }
    
    //split the long string into an array of "rows" of data. Each row is a string
    //detect "/n" carriage return, then split
    var rows = data.components(separatedBy: "\n")
    
    //remove header rows
    //count the number of header columns before removing
    let columnCount = rows.first?.components(separatedBy: ";").count
    rows.removeFirst()
    
    //now loop around each row and split into columns
    for row in rows {
        let csvColumns = row.components(separatedBy: ";")
        if csvColumns.count == columnCount{
            let cultureStruct = Culture.init(raw: csvColumns)
            csvToStruct.append(cultureStruct)
        }
    }
    
    return csvToStruct
}
