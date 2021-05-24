import UIKit
let firebaseService = FirebaseService()

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextField!
    
    @IBOutlet weak var randomNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firebaseService.updateNames() // get all the names from the database
        print("---------------------------------")
    }
    
    @IBAction func saveToFirebasePressed(_ sender: UIButton) {
        print("Save to Firebase Btn got pressed")
        if let text = textView.text {
            if text.count > 100 {
                print("The name is too long, not adding it")
            }
            firebaseService.addName(text: text)
            textView.text = ""
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

