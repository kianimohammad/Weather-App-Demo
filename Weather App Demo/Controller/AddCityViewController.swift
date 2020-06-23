//
//  ViewController.swift
//  Weather App Demo
//
//  Created by Mohammad Kiani on 2020-06-19.
//  Copyright © 2020 mohammadkiani. All rights reserved.
//

import UIKit

class AddCityViewController: UIViewController {

    @IBOutlet weak var cityTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //MARK: - Networking
    
    @IBAction func addCity(_ sender: UIButton) {
        
        
        cities?.append(cityTextField.text!.capitalized)
//        dismiss(animated: true, completion: nil)
        
        /*
        // step 1 - create URL
        
        if let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=\(cityTextField.text!.replacingOccurrences(of: " ", with: "%20"))&appid=5822f53158fdf0f22ed4fad25842783b") {
            
            // step 2 - create URLSession [like a browser]
            let urlSession = URLSession.shared
            
            // step 3 - give the urlSession a task to do
            let task = urlSession.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    print(error)
                } else {
                    if let data = data {
                        // data is of type JSON
                        
                        do {
                            let jsonResult = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary
//                            print(jsonResult!)
                            if let description = ((jsonResult?["weather"] as? NSArray)?[0] as? NSDictionary)?["description"] as? String {
                                print(description)
                            }
                        } catch {
                            print(error)
                        }
                        
                    }
                }
            }
            
            // step 4 - start the task
            task.resume()
            
        }
 */
        
        
        
        
        
        
    }
    
}

