//
//  MedicamentosViewModel.swift
//  AlternovaTCA
//
//  Created by Sergio Luis Noriega Pita on 26/04/24.
//

import Foundation
import CoreData
import SwiftUI
import Combine

class MedicamentosViewModel: ObservableObject {
    @Published var nombre: String = ""
    @Published var dosis: String = ""
    @Published var horario = Date()
    @Published var show = false
    @Published var updateItem : Medicamento! // Optional Binding
    
    
    //CoreData
    
    func saveData(context: NSManagedObjectContext){
        let newMedicamento = Medicamento(context: context)
        newMedicamento.nombre = nombre
        //newMedicamento.dosis = Int16(dosis)
        newMedicamento.dosis = dosis
        newMedicamento.horario = horario
        
        do {
            try context.save()
            debugPrint("Guardo Exitosamente ")
            show.toggle()
        } catch let error as NSError {
            // Alert para informar
            debugPrint("No se Guardo el medicamnento, \(error.localizedDescription)")
        }
        
    }
    
    func deleteMedicamento(item:Medicamento, context: NSManagedObjectContext){
        context.delete(item)
//        try! context.save()
        do {
            try context.save()
            debugPrint("Elimino Exitosamente")
        }  catch let error as NSError {
            debugPrint("No se Elimino el medicamnento, \(error.localizedDescription)")
        }
    }
    
    func sendData(item:Medicamento){
        updateItem = item
        nombre = item.nombre ?? ""
        //dosis = Int(item.dosis ?? 0)
        dosis = item.dosis ?? ""
        horario = item.horario ?? Date()
        show.toggle()
    }
    
    func editMedicamento(context: NSManagedObjectContext) {
        updateItem.horario = horario
        updateItem.nombre = nombre
        updateItem.dosis = dosis
        do {
            debugPrint("Edito Exitosamente")
            show.toggle()
        } catch let error as NSError {
            debugPrint("No se Edito el medicamnento, \(error.localizedDescription)")
        }
    }
    
    func reset() {
        // Aquí reinicias el estado del modelo, por ejemplo:
        nombre = ""
        dosis = ""
        horario = Date()
    }
    
}
