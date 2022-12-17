//
//  ViewController.swift
//  Concurrency
//
//  Created by Furkan Ademoğlu on 17.12.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let group = DispatchGroup()
        let queue1 = DispatchQueue(label: "first")
        queue1.async(group: group) {
            sleep(5)
            print("This is the first queue")
        }
        let queue2 = DispatchQueue(label: "first")
        queue2.async(group: group) {
            sleep(2)
            print("This is the first queue")
        }
        group.notify(queue: DispatchQueue.main){
            print("All have been executed")
            self.view.backgroundColor = .brown
        }
        
    }

    @IBAction func greenPressed(_ sender: Any) {
        let queue = DispatchQueue(label: "downloadimage")
        queue.async {
            sleep(5)
            DispatchQueue.main.async {
                self.view.backgroundColor = .green
            }
        }
    }
    
    @IBAction func redPressed(_ sender: Any) {
        view.backgroundColor = .red
    }
}

