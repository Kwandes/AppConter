import UIKit
let firebaseService = FirebaseService()

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firebaseService.startListener() // get all the notes from the database
        print("---------------------------------")
    }
    

    
    @IBAction func saveToFirebasePressed(_ sender: UIButton) {
        print("Save to Firebase Btn got pressed")
        if let text = textView.text {
            firebaseService.addNote(text: text)
        }
        print("---------------------------------")
        
    }
    
    @IBAction func getRandomName(_ sender: UIButton) {
        print("Generate new name button got pressed")
        print("---------------------------------")
        
    }
}

