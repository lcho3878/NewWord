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
    
    private var recentWord: [String] = []
    
    let resultDic: [String: String] = ["삼귀자": "연애를 시작하기 전 썸 단계!",
                                       "분좋카": "분위기 좋은 카페",
                                       "완내스": "완전 내 스타일의 줄임말",
                                       "그 잡채": "그 자체를 소리나는 대로 적은 것. 완벽 그 잡채라는 표현으로 사용한다",
                                       "H워얼V": "단어를 뒤집으면 사랑해 가 보인다"
    ]
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
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
        if button.currentTitle == " " {
            button.isHidden = true
        }
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
            addRecentWord(word)
            return result
        }
        else {
            return "검색 결과가 없습니다. 다른 단어를 검색해보세요"
        }
    }
    
    private func shuffle() {
        var tempDic = resultDic
        guard let word1 = tempDic.randomElement()?.key else { return }
        tempDic[word1] = nil
        guard let word2 = tempDic.randomElement()?.key else { return }
        tempDic[word2] = nil
        guard let word3 = tempDic.randomElement()?.key else { return }
        
        randomButton1.setTitle(word1, for: .normal)
        randomButton2.setTitle(word2, for: .normal)
        randomButton3.setTitle(word3, for: .normal)
    }
    
    private func addRecentWord(_ word: String) {
        guard !recentWord.contains(word) else {
            return
        }
        if recentWord.count > 2 {
            recentWord.removeFirst()
        }
        recentWord.append(word)
        saveData()
        changeRecentWordButtonTitles()
    }
    
    private func changeRecentWordButtonTitles() {
        var title1 = " "
        var title2 = " "
        var title3 = " "
        
        guard recentWord.count >= 2 else { return }
        title3 = recentWord[2]
        guard recentWord.count >= 1 else { return }
        title2 = recentWord[1]
        guard recentWord.count >= 0 else { return }
        title1 = recentWord[0]
        
        recentButton1.setTitle(title1, for: .normal)
        recentButton2.setTitle(title2, for: .normal)
        recentButton3.setTitle(title3, for: .normal)
        checkIsHidden(recentButton1)
        checkIsHidden(recentButton2)
        checkIsHidden(recentButton3)
        
    }
    
    private func checkIsHidden(_ button: UIButton) {
        if button.currentTitle == " " {
            button.isHidden = true
        }
        else {
            button.isHidden = false
        }
    }
    
    private func loadData() {
        guard let data = UserDefaults.standard.value(forKey: "recentWord") as? [String]  else { return }
        recentWord = data
        changeRecentWordButtonTitles()
    }
    
    private func saveData() {
        UserDefaults.standard.set(recentWord, forKey: "recentWord")
       
    }
}

