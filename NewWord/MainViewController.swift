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
    @IBOutlet var randomButton: UIButton!
    
    
    @IBOutlet var subView1: UIView!
    @IBOutlet var subView2: UIView!
    @IBOutlet var mainView: UIView!
    @IBOutlet var resultLabel: UILabel!
    
    
    let resultDic: [String: String] = ["삼귀자": "연애를 시작하기 전 썸 단계!",
                                       "분좋카": "분위기 좋은 카페",
                                       "완내스": "완전 내 스타일의 줄임말",
                                       "그 잡채": "그 자체를 소리나는 대로 적은 것. 완벽 그 잡채라는 표현으로 사용한다",
                                       "H워얼V": "단어를 뒤집으면 사랑해 가 보인다"
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBarView.layer.borderColor = UIColor.black.cgColor
        searchBarView.layer.borderWidth = 2
        
        searchTextField.borderStyle = .none
        
        searchButton.setTitle("", for: .normal)
        searchButton.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        searchButton.backgroundColor = .black
        searchButton.tintColor = .white
        
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
        guard let result = resultDic[word] else {
            resultLabel.text = "검색 결과가 없습니다. 다른 단어를 검색해보세요"
            return
        }
        resultLabel.text = result
    }
    
    @IBAction func randomButtonTapped(_ sender: UIButton) {
    }
    
    
}

