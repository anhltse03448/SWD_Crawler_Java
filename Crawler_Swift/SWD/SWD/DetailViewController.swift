//
//  DetailViewController.swift
//  SWD
//
//  Created by Anh Tuan on 3/1/17.
//  Copyright © 2017 Anh Tuan. All rights reserved.
//

import UIKit
import Fuzi
import Alamofire
import SwiftyJSON
class DetailApartment : NSObject {
    var imgURL : String
    var title : String
    var detail : String
    var price : String
    var dientich : String
    var type : String
    var khuvuc : String
    var href : String
    init(imgURL : String , title : String , detail : String,
         price : String , dientich : String, type : String, khuvuc : String, href : String) {
        self.imgURL = imgURL
        self.title = title
        self.detail = detail
        self.price = price
        self.dientich = dientich
        self.type = type
        self.khuvuc = khuvuc
        self.href = href
    }
}

class ApartmentObj : NSObject {
    var roomNumber : String
    var area : String
    var address : String
    var direction : String
    var numberOfBedRooms: String
    var numberOfBathRooms: String
    var project : String
    var floor : String
    var utillities : String
    var envoronment : String
    var descriptionStr : String
    var pricePerMetre : String
    var price : String
    var img : String
    var city : String
    var district : String
    init(roomNumber : String, area : String, address : String, direction : String, numberOfBedRooms : String,
         numberOfBathRooms : String, project : String, floor : String, utilities : String, envoroment : String,
         descriptionStr : String , pricePerMetre : String, price : String, img : String,
         city : String, district : String
        ) {
        self.roomNumber = roomNumber + " "
        self.area = area + " "
        self.address = address + " "
        self.direction = direction + " "
        self.numberOfBedRooms = numberOfBedRooms + " "
        self.numberOfBathRooms = numberOfBathRooms + " "
        self.project = project + " "
        self.floor = floor + " "
        self.utillities = utilities + " "
        self.envoronment = envoroment + " "
        self.descriptionStr = descriptionStr + " "
        self.pricePerMetre = pricePerMetre + " "
        self.price = price + " "
        self.img = img + " "
        self.city = city + " "
        self.district = district + " "
    }
    func toJSON() -> Dictionary<String, String>  {
        return ["RoomNumber" : self.roomNumber,
                "Area" : self.area,
                "Address" : self.address,
                "Direction" : self.direction,
                "NumberOfBedrooms" : self.numberOfBedRooms,
                "NumberOfBathrooms" : self.numberOfBathRooms,
                "Project" : self.project,
                "Floor" : self.floor,
                "Utilities" : self.utillities,
                "Environment" : self.envoronment,
                "Description" : self.descriptionStr,
                "PricePerMetreSquare" : self.pricePerMetre,
                "Price" : self.price,
                "Images" : self.img,
                "City" : self.city,
                "District" : self.district,
                "PrimaryKey" : "\(self.city + self.district)"
        ]
    }
}

class DetailViewController: LowestViewController {
    @IBOutlet weak var lblTitle : UILabel!
    @IBOutlet weak var btnBack : UIButton!
    @IBOutlet weak var tbl : UITableView!
    var listApartmentObj = [ApartmentObj]()
    var titleName : String = ""
    var urlLink = "http://nhadat24h.net/can-mua-nha-dat-bat-dong-san-tai-viet-nam-nha-dat-tai-viet-nam-s686598/"
    var list : [DetailApartment] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        lblTitle.text = titleName
        urlLink = "http://nhadat24h.net/ban-chung-cu-tai-viet-nam-s686570/"
        tbl.estimatedRowHeight = 100
        tbl.rowHeight = UITableViewAutomaticDimension
        
        
        DispatchQueue.global(qos: DispatchQoS.QoSClass.default).async {
            self.getInfo()
        }
    }
    
    func getInfo() {
        do {
            let htmlData1 = try HTMLDocument(string: self.getHTML(url: self.urlLink), encoding: String.Encoding.utf8)            
            let doc1 = htmlData1.xpath("//div[@class='dv-pt-ttcm']/div/ul/li")
            let count = doc1.count
            
            for i in 0 ..< 5887 {
                var url = self.urlLink
                if i != 0 {
                    url = url + "\(i)"
                }
                NSLog("URL \(url)")
                let htmlData = try HTMLDocument(string: self.getHTML(url: url), encoding: String.Encoding.utf8)
                let doc = htmlData.xpath("//div[@id='ContentPlaceHolder2_KetQuaTimKiem1_Pn1']/div")
                for item in doc {
                    if item.children.count == 2 {
                        let item1 = item.children[0]
                        var urlImage = ""
                        if item1.children.count == 0 {
                           urlImage = ""
                        } else {
                            urlImage = item1.children[0].attr("src")!
                        }
                        let item2 = item.children[1]
                        var titleName = ""
                        var detailValue = ""
                        if item2.children.count == 4 {
                            let dt1 = item2.children[0]
                            titleName = dt1.children[0].attr("title") ?? ""
                            let href = "http://nhadat24h.net/\(dt1.children[0].attr("href") ?? "")"
                            let dt2 = item2.children[1]
                            let dt3 = item2.children[2]
                            detailValue = dt3.stringValue
                            let dt4 = item2.children[3]
                            if dt4.children.count == 4 {
                                let a1 = dt4.children[0]
                                let price = a1.children[1].stringValue
                                let a2 = dt4.children[1]

                                let dientich = a2.children[1].stringValue
                                
                                let a3 = dt4.children[2]
                                
                                let type = a3.children[1].attr("title") ?? ""
                                
                                let a4 = dt4.children[3]
                                let khuvuc = a4.children[1].attr("title") ?? ""
                                let dtObj = DetailApartment.init(imgURL: urlImage, title: titleName, detail: detailValue, price: price, dientich: dientich, type: type, khuvuc: khuvuc , href : href)
                                list.append(dtObj)
                                self.getDetailInfo(url: dtObj.href)
                            }
                        }
                    }
                }
                DispatchQueue.main.async {
                    self.tbl.reloadData()
                }
            }
        } catch let error {
            NSLog("\(error)")
        }

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func backDidTouch(_ sender : UIButton){
        self.navigationController?.popViewController(animated: true)
        //self.navigationController?.dismiss(animated: true, completion: nil)
    }
    func getDetailInfo(url : String) {
        do {
            let htmlData1 = try HTMLDocument(string: self.getHTML(url: url), encoding: String.Encoding.utf8)
            var linkImage = ""
            let contentImage = htmlData1.xpath("//div[@class='myPanelClass']/ul/li")
            for item in contentImage {
                if item.children.count != 0 {
                    let href = item.children[0].attr("href")
                    if href != nil {
                        linkImage = href ?? ""
                    }
                }
            }
            var descriptionStr =  ""
            let contentDescrip = htmlData1.xpath("//div[@id='ContentPlaceHolder2_divContent']")
            if contentDescrip.count > 0 {
                descriptionStr = contentDescrip[0].stringValue
            }
            
            let parseUtil = ParseContent(descrip: descriptionStr)
            parseUtil.parseContent()
            
            
            let content = htmlData1.xpath("//div[@class='dv-tb-tsbds']/table/tbody/tr")
            var tongtien = ""
            var dientich = ""
            var mabds = ""
            var tinhtinh = ""
            var loaitin = ""
            var ngaydang = ""
            var quanHuyen = ""
            var vitri = ""
            var loadiBS = ""
            var huong = ""
            for i in 0 ..< content.count {
                var child = content[i].children[1]
                switch i {
                case 0:
                    tongtien = child.stringValue                    
                case 1:
                    dientich = child.stringValue
                case 2:
                    mabds = child.stringValue
                case 3:
                    tinhtinh = child.stringValue
                case 4:
                    loaitin = child.stringValue
                case 5:
                    ngaydang = child.stringValue
                case 6:
                    quanHuyen = child.stringValue
                case 7:
                    vitri = child.stringValue
                case 8:
                    loadiBS = child.stringValue
                case 9:
                    huong = child.stringValue
                default:
                    break
                }
            }
            let bdso = ApartmentObj(roomNumber: "", area: dientich, address: vitri, direction: huong, numberOfBedRooms: "\(parseUtil.countBedroom ?? 0)", numberOfBathRooms: "\(parseUtil.countWCRoom)", project: "", floor: "", utilities: "", envoroment: "", descriptionStr: "\(descriptionStr)", pricePerMetre: "", price: tongtien, img: linkImage, city: tinhtinh, district: quanHuyen)
            self.listApartmentObj.append(bdso)
            self.pushToDB(bdso: bdso)
            //NSLog("\(bdso.toJSON())")
            } catch {
            
        }
        
    }
    
    func pushToDB(bdso : ApartmentObj) {
        let param : [String : String] = ["RoomNumber": bdso.roomNumber.replacingOccurrences(of: "\n", with: ""),
                                         "Area" : bdso.area.replacingOccurrences(of: "\n", with: ""),
                                         "Address" : bdso.address.replacingOccurrences(of: "\n", with: ""),
                                         "Direction" : bdso.direction.replacingOccurrences(of: "\n", with: ""),
                                         "Project": bdso.project.replacingOccurrences(of: "\n", with: ""),
                                         "Floor" : bdso.floor.replacingOccurrences(of: "\n", with: ""),
                                         "Utilities" : bdso.utillities.replacingOccurrences(of: "\n", with: ""),
                                         "Environment" : bdso.envoronment.replacingOccurrences(of: "\n", with: ""),
                                         "Description" : bdso.descriptionStr.replacingOccurrences(of: "\n", with: ""),
                                         "PricePerMetreSquare" : bdso.pricePerMetre.replacingOccurrences(of: "\n", with: ""),
                                         "Price" : bdso.price.replacingOccurrences(of: "\n", with: ""),
                                         "Images" : bdso.img.replacingOccurrences(of: "\n", with: ""),
                                         "City" : bdso.city.replacingOccurrences(of: "\n", with: ""),
                                         "District" : bdso.district.replacingOccurrences(of: "\n", with: ""),
                                         "NumberOfBedrooms" : bdso.numberOfBedRooms.replacingOccurrences(of: "\n", with: ""),
                                         "PrimaryKey" : (bdso.project + bdso.address + bdso.floor + bdso.roomNumber + bdso.area).replacingOccurrences(of: "\n", with: ""),
                                         "NumberOfBathrooms" : bdso.numberOfBathRooms.replacingOccurrences(of: "\n", with: "")]
        Alamofire.request("https://apartment-crawl.herokuapp.com/api/apartments", method: .post, parameters: param).responseJSON(completionHandler: { (response) in
            let data = JSON.init(data: response.data!)
            
                NSLog("Hihi \(data)")
            
            
        })

    }
}
