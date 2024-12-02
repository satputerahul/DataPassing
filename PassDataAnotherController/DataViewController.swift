

import UIKit

class DataViewController: UIViewController {
    
    @IBOutlet var lblFirstNm: UILabel!
    @IBOutlet var lblEml: UILabel!
    @IBOutlet var lblMobNo: UILabel!
    @IBOutlet var lblAge: UILabel!
    @IBOutlet var lblGender: UILabel!
    
    var name: String!
    var email: String!
    var mobNo: String!
    var age: Int?
    var gender: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lblFirstNm.text = name
        lblEml.text = email
        lblMobNo.text = mobNo
        if let age = age { //checked if nil
            lblAge.text = String(age)
        }

        if let gender = gender { //checked if nil
            lblGender.text = gender
        }
        
    }

}
