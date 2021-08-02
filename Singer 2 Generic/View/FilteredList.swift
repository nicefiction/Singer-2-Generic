// FilteredList.swift

// MARK: - LIBRARIES -

import SwiftUI



struct FilteredList: View {
   
   // MARK: - PROPERTIES
   
   var fetchRequest: FetchRequest<Singer>
   
   
   
   // MARK: - COMPUTED PROPERTIES
   
   var singers: FetchedResults<Singer> { return fetchRequest.wrappedValue }
   
   
   var body: some View {
      
      List {
         ForEach(singers, id: \.self) { (singer: Singer) in
            Text("\(singer.wrappedLastName) \(singer.wrappedFirstName)")
         }
      }
   }
   
   
   
   // MARK: - INITIALIZER METHODS
   
   init(filter: String) {
      self.fetchRequest = FetchRequest(entity: Singer.entity(),
                                       sortDescriptors: [],
                                       predicate: NSPredicate(format: "lastName BEGINSWITH %@",
                                                              filter))
   }
}





// MARK: - PREVIEWS -

struct FilteredList_Previews: PreviewProvider {
   
   static var previews: some View {
      
      FilteredList(filter: "A")
   }
}
