//
//  ViewController.swift
//  RetainCycle
//
//  Created by Furkan Ademoğlu on 19.12.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var peter: User?
    var louis:User?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        peter = User(firstName: "Peter", lastName: "Griffin")
        louis = User(firstName: "Louis", lastName: "Quagmire")
        peter?.spouse=louis
        louis?.spouse = peter
        
        //Yukarıdaki spouse değişkenini eğer weak olarak tanımlamaz isek
        // retain cycle durumuna düşecek yani peter arc de count u 1 olacak memoryde kalmaya devam edecek
        peter = nil
    }


}

class User{
    let firstName:String
    let lastName:String
    weak var spouse:User?
    init(firstName:String,lastName:String){
        self.firstName = firstName
        self.lastName = lastName
    }
    
    deinit {
        print("\(firstName) has been removed from memory.")
    }
}

