//
//  MoviesByGenreViewController.swift
//  iMovieDB
//
//  Created by Danilo on 04/07/2018.
//  Copyright © 2018 Danilo Bias. All rights reserved.
//

import UIKit

class MoviesByGenreViewController: BaseViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var  filmsTableView: UITableView!
    
    // MARK: - Lets and Vars
    var genresViewModel: GenreViewModel! {
        didSet {
            genresViewModel.responseDidChange = { [weak self] viewModel in
                self?.getMoviesByGenre()
            }
        }
    }
    
    var moviesByGenreViewModel: MoviesByGenreViewModel! {
        didSet {
            moviesByGenreViewModel.responseDidChange = { [weak self] viewModel in
                self?.finishGetMovies()
            }
        }
    }

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.genresViewModel = GenreViewModel()
        self.makeGenresRequest()
    }
    
    // MARK: - Requests
    func makeGenresRequest() {
        self.showLoading()
        self.genresViewModel.getElement(completion: { (error) in
            // TO-DO: Tratar erro
            self.hideLoading()
        })
        
//        self.peopleViewModel?.getElement(firstPage: firstPage, completion: { (error) in
//
//            if let errorDetail = error {
//                //TO-DO
//                //Add placeholder to tableview
//                print("-->> Error get people [VC]: \(errorDetail)")
//                //                self.present(Alert.show(message: errorDetail.localizedDescription), animated: true, completion: nil)
//
//                let alert = UIAlertController(title: "Desculpe..." , message: errorDetail.localizedDescription, preferredStyle: UIAlertControllerStyle.alert)
//                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
//                self.present(alert, animated: true, completion: nil)
//            }
//        })
    }

    func getMoviesByGenre() {
        self.moviesByGenreViewModel = MoviesByGenreViewModel()
        if let genresArray: [Genres] = self.genresViewModel.response?.genres {
            for genre in genresArray {
                self.moviesByGenreViewModel.genreID = "\(genre.id!)"
                self.moviesByGenreViewModel.getElement { (error) in }
            }
        }
    }
    
    func finishGetMovies() {
        
        if self.genresViewModel.numberOfRows() == self.moviesByGenreViewModel.moviesByGenre.count {
            self.hideLoading {
                self.filmsTableView.reloadData()
            }
        }
    }
    
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }

    // MARK: - Memory
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension MoviesByGenreViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let genre: Genres = self.genresViewModel.getGenreBy(index: section)
        return genre.name ?? ""
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.genresViewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MovieByGenreTableViewCell = tableView.dequeueReusableCell(withIdentifier: "MoviesByGenreTableViewCell") as! MovieByGenreTableViewCell
        let moviesByGenre: MoviesByGenreResponse = self.moviesByGenreViewModel.getMoviesBy(index: indexPath.section)
        cell.configCellWith(movies: moviesByGenre)
        return cell
    }
    
}
