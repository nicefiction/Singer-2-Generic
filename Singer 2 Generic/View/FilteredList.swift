// FilteredList.swift
// MARK: - SOURCE -
// https://www.hackingwithswift.com/books/ios-swiftui/dynamically-filtering-fetchrequest-with-swiftui

// MARK: - LIBRARIES -

import SwiftUI
import CoreData



struct FilteredList<T: NSManagedObject, Content: View>: View {

   // MARK: - PROPERTIES

   var fetchRequest: FetchRequest<T>
   let content: (T) -> Content



   // MARK: - COMPUTED PROPERTIES

   // var singers: FetchedResults<Singer> { return fetchRequest.wrappedValue }
   var singers: FetchedResults<T> { return fetchRequest.wrappedValue }


   var body: some View {

      List {
         ForEach(singers,
                 id: \.self) { (singer: T) in
            // Text("\(singer.wrappedLastName) \(singer.wrappedFirstName)")
            self.content(singer)
         }
      }
   }



   // MARK: - INITIALIZER METHODS

   init(filterKey: String,
        filterValue: String,
        @ViewBuilder content: @escaping (T) -> Content) {

      self.fetchRequest = FetchRequest<T>(entity: T.entity(),
                                       sortDescriptors: [],
                                       predicate: NSPredicate(format: "%K BEGINSWITH %@",
                                                              filterKey,
                                                              filterValue))
      self.content = content
   }
}





// MARK: - PREVIEWS -

struct FilteredList_Previews: PreviewProvider {

   static var previews: some View {

      FilteredList(filterKey: "lastName",
                   filterValue: "S") { (singer: Singer) in
         Text(singer.wrappedLastName)
      }
   }
}
