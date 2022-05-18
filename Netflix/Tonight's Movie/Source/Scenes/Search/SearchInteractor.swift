//
//  SearchInteractor.swift
//  Tonight's Movie
//
//  Created by Madi Keshilbayev on 13.05.2022.
//

import Foundation

class SearchInteractor {
    weak var output: SearchInteractorOutput?
    
    private let dependencies: FullDependencies
    
    init(dependencies: FullDependencies = Dependencies.shared) {
        self.dependencies = dependencies
    }
}

// MARK: - Business Logic -

// PRESENTER -> INTERACTOR
extension SearchInteractor: SearchInteractorInput {
    
    func perform(_ request: Search.Request.SearchMovies) {
        let request = dependencies
            .repository
            .searchMovies(page: request.page, query: request.query) { (result) in
                switch result {
                case .success(let movies):
                    self.output?.present(Search.Response.MoviesFound(movies: movies))
                case .failure(let error):
                    self.output?.present(Search.Response.Error(errorMessage: error.localizedDescription))
                }
        }
        
        dependencies
            .requestsManager
            .registerRequest(with: .Search, request: request)
    }
    
    func perform(_ request: Search.Request.SearchTVShows) {
        let request = dependencies
            .repository
            .searchTVShows(page: request.page, query: request.query) { (result) in
                switch result {
                case .success(let tvShows):
                    self.output?.present(Search.Response.TVShowsFound(tvShows: tvShows))
                case .failure(let error):
                    self.output?.present(Search.Response.Error(errorMessage: error.localizedDescription))
                }
        }
        
        dependencies
            .requestsManager
            .registerRequest(with: .Search, request: request)
    }
    
    func cancel(_ request: Search.Cancel.Requests) {
        dependencies
            .requestsManager
            .cancelRequests(of: .Search)
    }
    
}
