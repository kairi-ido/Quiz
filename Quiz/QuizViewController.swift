//
//  QuizViewController.swift
//  Quiz
//
//  Created by 井戸海里 on 2020/09/17.
//  Copyright © 2020 IdoUmi. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    //問題文を格納する配列
    var quizArray = [Any]()
    //正解数を数えるための変数
    var correctAnser :Int = 0
    //クイズを表示するTextView
    @IBOutlet var quizTextView : UITextView!
    //選択肢のボタン
    @IBOutlet var choiceButton1 : UIButton!
    @IBOutlet var choiceButton2 : UIButton!
    @IBOutlet var choiceButton3 : UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //quizArrayに問題文、選択肢が３つ、答えの入った配列を追加
        quizArray.append(["初代ポケモンで主人公が最初にもらうポケモンの３匹のうちほのうタイプのポケモンは？","ロコン","ヒトカゲ","ブースター",2])
        quizArray.append(["キズぐすりで回復できるHPの量は？","20","30","40",1])
        quizArray.append(["ロケット団のボスの名前は？","ツバキ","イブキ","サカキ",3])
        quizArray.append(["シンオウ地方で一番最初に訪れるどうろ「201ばんどうろ」に出現する鳥ポケモンは？","ポッポ","スバメ","ムックル",3])
        quizArray.append(["イーブイの進化系のうち、草タイプのポケモンは？","グレイシア","リーフィア","サンダース",2])
        quizArray.append(["ヤドンの進化系の名前として、正しいのは？","ヤドキング","ヤドクイン","ヤドランド",1])
        
        //問題文をシャッフル
        quizArray.shuffle()
        //問題文を選択肢をラベルに表示させるメソッドを実行
        choiceQuiz()
        // Do any additional setup after loading the view.
    }
    
    //問題文を選択肢をラベルに表示させるメソッド
    func choiceQuiz(){
        
        //一時的にクイズを取り出しておく配列
        let tmpArray = quizArray[0] as! [Any]
        
        //問題文を表示
        quizTextView.text = tmpArray[0] as? String
        
        //選択肢ボタンにそれぞれの選択肢をセット
        choiceButton1.setTitle(tmpArray[1] as? String, for: .normal)
        choiceButton2.setTitle(tmpArray[2] as? String, for: .normal)
        choiceButton3.setTitle(tmpArray[3] as? String, for: .normal)
    }
    //コードで画面遷移の準備,問題が全て終わったら結果画面に遷移するようにする
    func performSegueToResult(){
        
        performSegue(withIdentifier: "ToResultView", sender: nil)
        
    }
    //セグエを準備(prepare)する時に呼ばれるメソッド、QuizViewControllerからResultViewControllerに値をうけ渡す
    override func prepare(for segue: UIStoryboardSegue, sender : Any?){
        if segue.identifier == "ToResultView"{
            let resultViewController  = segue.destination as! ResultViewController
            resultViewController.correctAnser = self.correctAnser
        }
        
    }
    //Tagの値を使ってボタンの機能を実装するメソッド
    @IBAction func choiceAnswer(sender : UIButton){
        //一時的にクイズを取り出しておく配列
        let tmpArray = quizArray[0] as! [Any]
        
        //クイズの正解番号とsender.tagを比べることでクイズの正誤を判定する
        if tmpArray[4] as! Int == sender.tag{
            //正解数を増やす
            correctAnser = correctAnser + 1
        }
        //といた問題をquizArrayから取り除く
        quizArray.remove(at: 0)
        
        //といた問題の合計数があらかじめ設定していた問題数に達した時は結果画面へ
        if quizArray.count == 0 {
            performSegueToResult()
            
        //それ以外の場合が問題文と選択肢を表示
        }else {
            choiceQuiz()
        }
        
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
