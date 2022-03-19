//
//  ComicsViewModel.swift
//  xkcd
//
//  Created by Galileo Guzman on 16/03/22.
//

import Foundation

final class ComicsViewModel {
    
    // MARK: - Properties

    private let dataRepository: ComicsRepository

    private var comics: [ComicModel] = [] {
        didSet {
            DispatchQueue.main.async {
                self.comicsDidChange?()
            }
        }
    }
    
    // MARK: - Data biding
    
    var comicsDidChange: (() -> Void)?
    
    // MARK: - Initialization

    init(dataRepository: ComicsRepository) {
        // Set properties
        self.dataRepository = dataRepository
        self.dataRepository.comicRetrieved = {[weak self] (comic) in
            self?.comics.append(comic)
        }

        // Fetch comics for presenting
        fetchComics()
    }
    
    // MARK: Private methods
    private func fetchComics() {
        dataRepository.getComics()
    }
    
    private func comic(at index: Int) -> ComicModel {
        return comics[index]
    }
    
    // MARK: Public API
    
    var numberOfComics: Int {
        return comics.count
    }
    
    func presentable(for index: Int) -> ComicPresentable {
        return ComicCellViewModel(comic: comic(at: index))
    }
    
}
