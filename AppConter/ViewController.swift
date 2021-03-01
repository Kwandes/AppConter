import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextField!
    private var database = Firestore.firestore()
    private var notes = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startListener()
        // Do any additional setup after loading the view.
    }
    
    func startListener(){
        database.collection("notes").addSnapshotListener {
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
    }
    
    @IBAction func saveToFirebasePressed(_ sender: UIButton) {
        print("Save to Firebase Btn got pressed")
        if let text = textView.text {
            if text.count > 0 {
                let document = database.collection("notes").document()
                var data = [String:String]()
                data["text"] = text
                document.setData(data)
                print("Data sent to the database")
            } else {
                print("The input was empty, doing nothing")
            }
        }
        
    }
}

