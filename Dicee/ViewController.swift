
import UIKit

class ViewController: UIViewController {
    
    var randomDiceIndex1 : Int = 0
    var randomDiceIndex2 : Int = 0
    
    let diceArray = ["dice1", "dice2", "dice3", "dice4", "dice5", "dice6"]
    
    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateDiceImages()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func rollButtonPressed(_ sender: UIButton) {
        
        updateDiceImages()
        
    }
    
    func updateDiceImages() {
        
        for time in 1...5 {
        
            delay(Double(time)*0.1) {

                self.randomDiceIndex1 = Int(arc4random_uniform(6))
                self.randomDiceIndex2 = Int(arc4random_uniform(6))
        
                self.diceImageView1.image = UIImage(named: self.diceArray[self.randomDiceIndex1])
                self.diceImageView2.image = UIImage(named: self.diceArray[self.randomDiceIndex2])
                
                print ("\(self.randomDiceIndex1)")
            
            }
        }
    
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        
        updateDiceImages()
        
    }
    
    func delay(_ delay:Double, closure:@escaping ()->()) {
        DispatchQueue.main.asyncAfter(
            deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure)
    }
    
}

