//
//  LowestViewController.swift
//  ZingApp
//
//  Created by Anh Tuan on 1/16/17.
//  Copyright © 2017 Anh Tuan. All rights reserved.
//

import UIKit

class LowestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func getHTML(url : String) -> String{
        let myURLString = url
        guard let myURL = NSURL(string: myURLString) else {
            //print("Error: \(myURLString) doesn't seem to be a valid URL")
            return ""
        }
        
        do {
            let myHTMLString = try String(contentsOf: myURL as URL)
            return myHTMLString
        } catch _ as NSError {
            return ""
        }
    }

}
extension String {
    var html2AttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return nil }
        do {
            return try NSAttributedString(data: data, options: [NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType, NSCharacterEncodingDocumentAttribute: String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch let error as NSError {
            print(error.localizedDescription)
            return  nil
        }
    }
    var html2String: String {
        return html2AttributedString?.string ?? ""
    }
}

