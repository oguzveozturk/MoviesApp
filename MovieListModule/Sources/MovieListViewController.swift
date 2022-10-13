//
//  MovieListViewController.swift
//  MovieListModule
//
//  Created by Oğuz Öztürk on 13.10.2022.
//

import UIKit
import Common

public final class MovieListViewController: UITableViewController, MovieListViewProtocol {
    
    private var movies = [MoviePresentation]()
    var presenter:MovieListPresenterProtocol!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        presenter.load()
    }
    
    func setTitle(_ text: String) {
        self.title = text
    }
    
    func setLoading(_ isLoading: Bool) {
        print(isLoading)
    }
    
    func reloadData() {
        self.tableView.reloadData()
    }
    
    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.movies.count
    }
    
    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let movie = presenter.movie(indexPath.row)
        var content = cell.defaultContentConfiguration()
        content.text = movie.title
        content.secondaryText = movie.detail
        cell.contentConfiguration = content
        return cell
    }
    
    public override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        presenter.selectMovie(at: indexPath.row)
    }
}
