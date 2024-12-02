

import UIKit

class PassDataCell: UITableViewCell
{

    @IBOutlet var lbl_SelectGender: UILabel!
    
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet var txtNm: UITextField!
    @IBOutlet var txtEml: UITextField!
    @IBOutlet var txtMobNm: UITextField!
    @IBOutlet var txtAge: UITextField!
    @IBOutlet var tv_gender: UITableView!
    @IBOutlet var btnSelectGender: UIButton!
    
    let gender = ["Male", "Female", "Other"]
    
    var strGender: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        txtMobNm.keyboardType = .numberPad
        txtEml.keyboardType = .emailAddress
        
        tv_gender.dataSource = self
        tv_gender.delegate = self
        
        tv_gender.isHidden = true
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gender.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tv_gender.dequeueReusableCell(withIdentifier: "DataCell", for: indexPath) as! PassDataCell
        cell.lbl_SelectGender.text = gender[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectGender = gender[indexPath.row]
        strGender = selectGender
        btnSelectGender.setTitle(selectGender, for: .normal)

        UIView.animate(withDuration: 0.1) {
            self.tv_gender.isHidden = true
            self.btnSelectGender.transform = .identity
            
        }
        
    }
    
    @IBAction func btn_Submit(_ sender: UIButton) {
        
        print("Gender: \(btnSelectGender.title(for: .normal) ?? "Not Selected")")
        
      //  let secondStoryboard: UIStoryboard = UIStoryboard.init(name: "Main", bundle: nil)
//        let secondViewController: UIViewController = secondStoryboard.instantiateViewController(withIdentifier: "DataController") as! DataViewController
        let sec:DataViewController = self.storyboard?.instantiateViewController(withIdentifier: "DataController") as! DataViewController
        
        sec.name = txtNm.text
        sec.email = txtEml.text
        sec.mobNo = txtMobNm.text
        if let age = txtAge.text, !age.isEmpty, let intAge = Int(age) {
            sec.age = intAge
        }
        
        if let strGender = strGender {
            sec.gender = strGender
        }
        
        present(sec, animated: true)
        
        
    }
    
    @IBAction func btnSelectGender(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.1) {
//            self.tv_gender.isHidden = !self.tv_gender.isHidden
//            self.btnSelectGender.transform = self.btnSelectGender.transform.rotated(by: .zero)
            
            self.tv_gender.isHidden.toggle()
            self.btnSelectGender.transform = self.btnSelectGender.transform.rotated(by: .zero)
            
        }
        
    }
    
}
