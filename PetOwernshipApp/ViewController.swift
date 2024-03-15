//
//  ViewController.swift
//  PetOwernshipApp
//
//  Created by student on 3/15/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func saveBtn(_ sender: Any) {
        let fm = FileManager.default
        let urls = fm.urls(for: .documentDirectory, in: .userDomainMask)
        let url = urls.last?.appendingPathComponent("file.text")
        do {
            try txtEnter.text.write(to: url!, atomically: true, encoding: String.Encoding.utf8)
        } catch {
            print("Error writing to file")
        }
    }
    
    @IBAction func showBtn(_ sender: Any) {
        let fm = FileManager.default
        let urls = fm.urls(for: .documentDirectory, in: .userDomainMask)
        let url = urls.last?.appendingPathComponent("file.text")
        do {
            let fileContent = try String(contentsOf: url!, encoding: String.Encoding.utf8)
            txtShow.text = fileContent
        } catch {
            print("Error reading from file")
        }
    }
    
    @IBOutlet weak var txtEnter: UITextView!
    
    @IBOutlet weak var txtShow: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtEnter.text = "What does this dog make you think of"
        txtShow.text = ""
        // Do any additional setup after loading the view.
    }


}

