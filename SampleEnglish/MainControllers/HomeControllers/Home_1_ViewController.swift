//
//  Home(1)ViewController.swift
//  SampleEnglish
//
//  Created by 中田伊織 on 2022/02/11.
//

import UIKit

class Home_1_ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var partNumber: Int = 0
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //storyboard上のセルを生成
        let cell:UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)

        //セル上のTag(1)とつけたUILabelを生成
        let label = cell.contentView.viewWithTag(1) as! UILabel

        //セルの番号をラベルのテキストに反映させる
        label.text = "Part " + String(indexPath.row + 1)

        return cell
    }
    
    

    // Screenサイズに応じたセルサイズを返す
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // 機種ごとの横幅の値を取ってきて、それに応じてセルの横幅を決める
        let screen_width :CGFloat = UIScreen.main.bounds.size.width
        
        let image_width :CGFloat = (screen_width - 40)/4
        let image_height :CGFloat = image_width
        return CGSize(width: image_width, height: image_height)
    }
    
    //セル選択時の処理
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //どの単語データをテストするかをユーザーに選択させ、そのデータをセットする
        partNumber = indexPath.row + 1
        // 画面遷移
        performSegue(withIdentifier: "goNext", sender: nil)
    }

    // 変数の引き継ぎ
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let Home_2_VC = segue.destination as! Home_2_ViewController
        Home_2_VC.partNumber = partNumber
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // ナビゲーションバーを表示する
        navigationController?.setNavigationBarHidden(false, animated: false)
        collectionView.delegate = self

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


