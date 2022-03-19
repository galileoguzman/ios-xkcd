//
//  ComicsRepository.swift
//  xkcd
//
//  Created by Galileo Guzman on 15/03/22.
//

import Foundation


class ComicsRepository {
    
    private let key = "comics"
    private let defaults = UserDefaults.standard
    private let service = ComicsService()
    
    private var counterComics = 0
    private let limitOfComics = 25
    private var lastComicIndex = 0
    
    // MARK: Data binding
    var comicRetrieved: ((ComicModel) -> Void)?
    
    init() {
        if(defaults.object(forKey: key) == nil) {
            defaults.set([], forKey: key)
        }
    }
    
    func getComics() {
        // 1. Fetch last comic from API
        // 2. Store in memory the response of first step
        // 3. Start a process to fetch 24 comics from the last step
        // 3.1 Loop based o limit and first fetched comic
        // 3.2 Save/Append every response model into comics list
        // 4. When loop is finished, save comics list in memory
        // 5. Return comics list from memory
        
        service.getLatestComic { [weak self] (result) in
            switch result {
            case .success(let latestComic):
                self?.newComicRetrieved(latestComic)
            case .failure(let error):
                print("Error getting latest commic from service class \(error.rawValue)")
                break
            }
        }
    }
    
    private func newComicRetrieved(_ comic:ComicModel) {
        counterComics += 1
        comicRetrieved?(comic)
        if counterComics <= limitOfComics {
            print("Trying to fetch comic \(comic.num - 1)")
            fethcComic(with: comic.num - 1)
        }
    }
    
    private func fethcComic(with index:Int) {
        
        service.getComicWith(number: index, completed: {[weak self](result) in
            switch result {
            case .success(let comic):
                print("Comic retrieved \(comic.num)")
                self?.newComicRetrieved(comic)
            case .failure(let error):
                print("Error getting comic with number \(index) \n\(error.rawValue)")
                    break
            }
        })
        
    }
    
    private func fetchComicsFromMemory() -> [ComicModel] {
        guard let comics = defaults.object(forKey: key) as? [ComicModel] else {
            return []
        }
        return comics
    }
}
