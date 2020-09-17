//
//  ResultViewController.swift
//  Quiz
//
//  Created by 井戸海里 on 2020/09/17.
//  Copyright © 2020 IdoUmi. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    //正解数を数える変数
    var correctAnser :Int = 0
    //結果を表示するラベルの宣言
    @IBOutlet var resultLabel : UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        //正解数をもらい表示
        resultLabel.text = String(correctAnser)

        // Do any additional setup after loading the view.
    }
    //戻るボタンの宣言
    @IBAction func back(){
        self.presentingViewController?.presentingViewController?
        .dismiss(animated: true, completion: nil)
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
