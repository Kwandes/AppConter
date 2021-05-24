import UIKit
let firebaseService = FirebaseService()

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextField!
    
    @IBOutlet weak var randomNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firebaseService.startListener() // get all the names from the database
        print("---------------------------------")
    }
    
    @IBAction func saveToFirebasePressed(_ sender: UIButton) {
        print("Save to Firebase Btn got pressed")
        if let text = textView.text {
            firebaseService.addName(text: text)
        }
        print("---------------------------------")
        
    }
    
    @IBAction func getRandomName(_ sender: UIButton) {
        print("Generate new name button got pressed")
        let randomName = firebaseService.getRandomName()
        print("Setting generated name to \(randomName)")
        randomNameLabel.text = randomName
        print("---------------------------------")
        
    }
}

