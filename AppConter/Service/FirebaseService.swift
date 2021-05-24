import Foundation
import Firebase

// all your database connection and query needs will be satisfied here
class FirebaseService {
    
    private var database = Firestore.firestore()
    private var names = [String]()
    
    // add a new name to the database
    func addName(text:String) {
            if text.count > 0 {
                let document = database.collection("names").document()
                var data = [String:String]()
                data["text"] = text
                document.setData(data)
                print("Data sent to the database")
            } else {
                print("The input was empty, doing nothing")
            }
        updateNames()
    }
    
    // get a random name. Return "n/a" if there are no names present
    func getRandomName() -> String
    {
        return names.randomElement() == nil ? "n/a" : names.randomElement()!
    }
    
    // sync the names[] array with the database
    func updateNames()
    {
        print("Updating the names array")
        database.collection("names").getDocuments() {
            (snap, error) in
            print("Snapshot doing its thing")
            if let e = error{
                print ("Error fetching data \(e)")
            } else {
                if let s = snap {
                    self.names = [String]() // clear the array
                    for document in s.documents {
                        // update the names array with the database data
                        self.names.append(document.data()["text"] as! String)
                    }
                    print("Finished fetching DB data")
                }
            }
        }
    }
    
    // get the data from the database
    func startListener() {
        database.collection("names").addSnapshotListener {
            (snap, error) in
            print("Snapshot doing its thing")
            if let e = error{
                print ("Error fetching data \(e)")
            } else {
                if let s = snap {
                    for document in s.documents {
                        print(document.documentID)
                        print(document.data()["text"] as! String)
                    }
                    print("Finished fetching DB data")
                }
            }
        }
        
        updateNames()
    }
}
