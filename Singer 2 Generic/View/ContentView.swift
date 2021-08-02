//
//  ContentView.swift
//  Singer 2 Generic
//
//  Created by Olivier Van hamme on 02/08/2021.
// ContentView.swift

// MARK: - LIBRARIES -

import SwiftUI
import CoreData



struct ContentView: View {
   
   // MARK: - PROPERTY WRAPPERS
   
   @Environment(\.managedObjectContext) var moc
   @State private var letterFilter: String = "A"
   
   
   
   // MARK: - COMPUTED PROPERTIES
   
   var body: some View {
      
      VStack {
         FilteredList(filter: letterFilter)
         VStack(spacing: 20) {
            Button("Add Singers") {
               let taylor: Singer = Singer(context: moc)
               taylor.firstName = "Taylor"
               taylor.lastName = "Swift"
               
               let ed = Singer(context: self.moc)
               ed.firstName = "Ed"
               ed.lastName = "Sheeran"
               
               let adele = Singer(context: self.moc)
               adele.firstName = "Adele"
               adele.lastName = "Adkins"
               
               if self.moc.hasChanges {
                  try? self.moc.save()
               }
            }
            Button("Filter A") {
               self.letterFilter = "A"
            }
            Button("Filter S") {
               self.letterFilter = "S"
            }
         }
         .font(.title)
      }
   }
}





// MARK: - PREVIEWS -

struct ContentView_Previews: PreviewProvider {
   
   static var previews: some View {
      
      ContentView()
   }
}
