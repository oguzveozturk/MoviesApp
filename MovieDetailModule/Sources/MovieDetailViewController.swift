//
//  MovieDetailViewController.swift
//  MovieDetailModule
//
//  Created by Oğuz Öztürk on 14.10.2022.
//

import UIKit
import Common

public final class MovieDetailViewController: UIViewController, MovieDetailViewProtocol {
    var presenter:MovieDetailPresenterProtocol!
    
    private lazy var titleLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    private lazy var detailLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    private lazy var stackView:UIStackView = {
       let s = UIStackView()
        s.translatesAutoresizingMaskIntoConstraints = false
        s.spacing = 10
        s.axis = .vertical
        return s
    }()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLayout()
        presenter.load()
    }
    
    func handleOutput(_ output: MoviePresentation) {
        titleLabel.text = output.title
        detailLabel.text = output.detail
    }
    
    func setupLayout() {
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(detailLabel)
        
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 15),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -15),
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 15)
        ])
    }
}
