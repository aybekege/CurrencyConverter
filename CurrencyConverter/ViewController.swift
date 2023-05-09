//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Ege Aybek on 9.05.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cadLabel: UILabel!
    @IBOutlet weak var tryLabel: UILabel!
    @IBOutlet weak var usdLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func getRates(_ sender: Any) {
        print("Ege Aybek hehjkhe ")
        
        let url = "https://api.apilayer.com/fixer/latest?"
        let url2 = "https://raw.githubusercontent.com/atilsamancioglu/CurrencyData/main/currency.json"
        var request = URLRequest(url: URL(string: url)!,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"
        request.addValue("vIoZGam1IRHnktXz1j39SQiwkryVl0zA", forHTTPHeaderField: "apikey")
        
        let task = URLSession.shared.dataTask(with: request){ data , response, error in
            
           
            if error == nil {
                
                do {
                    
                    
                    let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String,Any>
                    print(jsonResponse["rates"]!)
                    
                    DispatchQueue.main.async {
                        
                        print("icerdeyiz")
                        if let rates = jsonResponse["rates"] as? [String : Any] {
                            
                            
                            
                            if let cad = rates["CAD"] {
                                self.cadLabel.text = "CAD: \(cad)"
                            }
                            if let usd = rates["USD"] {
                                self.usdLabel.text = "USD: \(usd)"
                            }
                            if let turkish = rates["TRY"]  {
                                self.tryLabel.text = "TRY: \(turkish)"
                            }
                        }
                    }
                    
                    
                }
                    catch {
                        print("error")
                    }
                }
                
                
            }
        task.resume()
        }
        
        
        
    }
    


