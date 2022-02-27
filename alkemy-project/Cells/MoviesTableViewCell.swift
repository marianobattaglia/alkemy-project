//
//  MoviesTableViewCell.swift
//  alkemy-project
//
//  Created by Mariano Battaglia on 22/02/2022.
//

import UIKit

class MoviesTableViewCell: UITableViewCell {

    @IBOutlet weak var movieProfileImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.updateHearts()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.selectionStyle = .none
    }

    @IBAction func favoriteButtonDidTap(_ sender: Any) {
        AppDelegate.userDefaultAlreadyExist("moviesStored") ? searchTitleStored() : createMovieStoreAndAppend()
    }
    
    func searchTitleStored() {
        let arrayDefault = getArrayUserDefault()
        let text = self.movieTitle.text!
        let elem = arrayDefault?.filter({ $0.contains(text)})
        (elem?.count ?? Int() > 0) ? removeTitle() : checkTitleOrEmpty()
        UserDefaults.standard.synchronize()
    }
    
    override func prepareForReuse() {
        self.updateHearts()
    }
    
    func removeTitle() {
        removeTitleFromUserDefault()
    }
    
    func checkTitleOrEmpty() {
        if UserDefaults.standard.array(forKey: "moviesStored") != nil {
            appendTitleToUserDefault()
        }else {
            createMovieStoreAndAppend()
        }
    }
    
    func appendTitleToUserDefault(){
        var arrayUserDefaults = getArrayUserDefault()
        arrayUserDefaults?.append(self.movieTitle.text ?? String())
        updateUserDefaultWith(arrayUserDefaults ?? [String]())
        self.fillHeart()
    }
    
    func removeTitleFromUserDefault() {
        var arrayDefault = getArrayUserDefault()
        let index = arrayDefault?.firstIndex(of: self.movieTitle.text ?? String()) ?? Int()
        arrayDefault?.remove(at: index)
        updateUserDefaultWith(arrayDefault ?? [String]())
        self.emptyHeart()
    }
    
    func createMovieStoreAndAppend() {
        updateUserDefaultWith([String]())
        let elem = self.movieTitle.text ?? String()
        var arrayUserDefaults = getArrayUserDefault()
        arrayUserDefaults?.append(elem)
        updateUserDefaultWith(arrayUserDefaults ?? [String]())
        self.fillHeart()
    }
    
    func checkIconHeart(){
        if let userDefault = getArrayUserDefault(), userDefault.count > 0 {
            let results = userDefault.filter({ $0.contains(self.movieTitle.text!)})
            (results.count > 0) ? self.fillHeart() : self.emptyHeart()
        }
    }
    
    func emptyHeart(){
        self.favoriteButton.setImage(UIImage(systemName: "heart"), for: .normal)
    }
    
    func fillHeart() {
        self.favoriteButton.setImage(UIImage(systemName: "suit.heart.fill"), for: .normal)
    }
    
    func updateUserDefaultWith(_ value: [String]){
        UserDefaults.standard.setValue(value, forKey: "moviesStored")
    }
    
    func getArrayUserDefault() -> [String]? {
        AppDelegate.getUserDefaultArrayStringForKey("moviesStored")
    }
    
    func updateHearts(){
        DispatchQueue.main.async {
            self.checkIconHeart()
        }
    }
}
