//
//  ViewController.swift
//  xkcd
//
//  Created by Galileo Guzman on 15/03/22.
//

import UIKit

class ComicsViewController: UIViewController, Storyboardable {
    
    // MARK: View data variables
    var viewModel: ComicsViewModel?

    // MARK: Helper API
    var didSelectComic: ((ComicPresentable) -> Void)?
    
    @IBOutlet weak var tblComics: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initController()
    }
    
    private func initController() {
        
        // Navigation style
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Latests 25"
        
        configureTableView()
        configureViewModel()
    }
    
    // MARK: Configuration methods
    func configureViewModel() {
        viewModel?.comicsDidChange = { [weak self] in
            // Update Table View
            self?.tblComics.reloadData()
        }
    }
    func configureTableView(){
        tblComics.register(
            UINib(nibName: LastComicCell.identifier, bundle: nil),
            forCellReuseIdentifier: LastComicCell.identifier
        )
        tblComics.register(
            UINib(nibName: SingleComicCell.identifier, bundle: nil),
            forCellReuseIdentifier: SingleComicCell.identifier
        )
    }

}

extension ComicsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return LastComicCell.height
        }
        
        return SingleComicCell.height
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfComics ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Fetch Presentable
        guard let presentable = viewModel?.presentable(for: indexPath.item) else {
            fatalError("No presentable object available")
        }
        
        // Dequeue Table View Cell
        if indexPath.row == 0 {
            let cell: LastComicCell = tableView.dequeueReusableCell(for: indexPath)
            cell.configure(with: presentable)
            return cell
        } else {
            let cell: SingleComicCell = tableView.dequeueReusableCell(for: indexPath)
            cell.configure(with: presentable)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // AppCoordinator will show the detail view controller
        guard let comicPresentable = viewModel?.presentable(for: indexPath.item) else {
            fatalError("No Presentable Available")
        }
        
        didSelectComic?(comicPresentable)
        
    }
}
