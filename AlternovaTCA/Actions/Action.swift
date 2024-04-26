//
//  Action.swift
//  AlternovaTCA
//
//  Created by Sergio Luis Noriega Pita on 26/04/24.
//

import Foundation

enum Action {
    case loadMedications
    case medicationsLoaded(Medication)
    case addMedication(Medication)
    case deleteMedication(at: IndexSet)
    case UpdateMedication(Medication)
    case showMedicationDetails(Medication)
    case showAlert(String)
    case selectedMedication(Medication)
}

struct Medication {
    let name: String
    let dossage: String
    let schedule: String 
}
