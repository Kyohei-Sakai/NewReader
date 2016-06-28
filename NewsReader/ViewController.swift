//
//  ViewController.swift
//  NewsReader
//
//  Created by 酒井恭平 on 2016/06/25.
//  Copyright © 2016年 酒井恭平. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    //ニュース一覧データを格納する配列
    var newsDataArray = NSArray()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //ニュース情報の取得先
        let requestUrl = "http://appcre.net/rss.php"
        //Webサーバに対してHTTP通信のリクエストを出してデータを取得
        Alamofire.request(.GET, requestUrl).responseJSON { response in
            switch response.result {
            case .Success(let json):
                //JSONデータをNSDictionaryに
                let jsonDic = json as! NSDictionary
                //辞書化したjsonDicからキー値"responseData"を取り出す
                let responseData = jsonDic["responseData"] as! NSDictionary
                //responseDataからキー値"results"を取り出す
                self.newsDataArray = responseData["results"] as! NSArray
                print("\(self.newsDataArray)")
                
            case .Failure(let error):
                print("通信エラー：\(error)")
            }
        }
        
        //ニュース記事データをテーブルビューに表示
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

