//
//  ContentView.swift
//  AlternovaTCA
//
//  Created by Sergio Luis Noriega Pita on 26/04/24.
//

import SwiftUI
import CoreData
import ComposableArchitecture

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>

    var body: some View {
        Text("Content view")
    }


}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View{
        ContentView()
    }
}
