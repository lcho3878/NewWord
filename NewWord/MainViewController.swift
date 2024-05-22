//
//  ViewController.swift
//  NewWord
//
//  Created by 이찬호 on 5/17/24.
//

import UIKit

class MainViewController: UIViewController {
//
    @IBOutlet var searchBarView: UIView!
    @IBOutlet var searchTextField: UITextField!
    @IBOutlet var searchButton: UIButton!
    @IBOutlet var randomButton1: UIButton!
    @IBOutlet var randomButton2: UIButton!
    @IBOutlet var randomButton3: UIButton!
    @IBOutlet var recentButton1: UIButton!
    @IBOutlet var recentButton2: UIButton!
    @IBOutlet var recentButton3: UIButton!
    
    
    
    @IBOutlet var subView1: UIView!
    @IBOutlet var subView2: UIView!
    @IBOutlet var mainView: UIView!
    @IBOutlet var resultLabel: UILabel!
    
    private var recentWord: [String]?
    
    let resultDic: [String: String] = ["삼귀자": "연애를 시작하기 전 썸 단계!",
                                       "분좋카": "분위기 좋은 카페",
                                       "완내스": "완전 내 스타일의 줄임말",
                                       "그 잡채": "그 자체를 소리나는 대로 적은 것. 완벽 그 잡채라는 표현으로 사용한다",
                                       "H워얼V": "단어를 뒤집으면 사랑해 가 보인다"
    ]
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBarViewSetting()
        buttonSetting(randomButton1)
        buttonSetting(randomButton2)
        buttonSetting(randomButton3)
        buttonSetting(recentButton1)
        buttonSetting(recentButton2)
        buttonSetting(recentButton3)
        resultViewSettig()
        shuffle()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    private func searchBarViewSetting() {
        searchBarView.layer.borderColor = UIColor.black.cgColor
        searchBarView.layer.borderWidth = 2
        
        searchTextField.borderStyle = .none
        
        searchButton.setTitle("", for: .normal)
        searchButton.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        searchButton.backgroundColor = .black
        searchButton.tintColor = .white
    }
    
    private func buttonSetting(_ button: UIButton) {
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 5
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1.5
        button.titleLabel?.font = .boldSystemFont(ofSize: 15)
    }
    
    private func resultViewSettig() {
        mainView.layer.borderColor = UIColor.black.cgColor
        mainView.layer.borderWidth = 2
        subView1.layer.borderColor = UIColor.black.cgColor
        subView1.layer.borderWidth = 2
        subView2.layer.borderColor = UIColor.black.cgColor
        subView2.layer.borderWidth = 2
        subView2.backgroundColor = .black
        
        resultLabel.text = "신조어를 검색해보세요!"
        resultLabel.font = .boldSystemFont(ofSize: 20)
    }

    @IBAction func searchButtonTapped(_ sender: UIButton) {
        guard let word = searchTextField.text else { return }
        let result = searchWord(word)
        resultLabel.text = result
        shuffle()
        searchTextField.endEditing(true)
    }
    
    @IBAction func randomButtonTapped(_ sender: UIButton) {
        guard let word = sender.titleLabel?.text else { return }
        let result = searchWord(word)
        searchTextField.text = word
        resultLabel.text = result
        shuffle()
    }
    
    @IBAction func searchTextFieldTapped(_ sender: UITextField) {
        guard let word = sender.text else { return }
        let result = searchWord(word)
        searchTextField.text = word
        resultLabel.text = result
        shuffle()
    }
    
    
    private func searchWord(_ word: String) -> String {
        if let result = resultDic[word] {
            return result
        }
        else {
            return "검색 결과가 없습니다. 다른 단어를 검색해보세요"
        }
    }
    
    private func shuffle() {
        var tempDic = resultDic
        guard let word1 = tempDic.randomElement()?.key else { return }
//        tempDic.removeValue(forKey: word1)
        tempDic[word1] = nil
        guard let word2 = tempDic.randomElement()?.key else { return }
        tempDic[word2] = nil
        guard let word3 = tempDic.randomElement()?.key else { return }
        
        randomButton1.setTitle(word1, for: .normal)
        randomButton2.setTitle(word2, for: .normal)
        randomButton3.setTitle(word3, for: .normal)
    }
}

