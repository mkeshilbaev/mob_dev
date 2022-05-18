//
//  SearchProtocols.swift
//  Tonight's Movie
//
//  Created by Madi Keshilbayev on 13.05.2022.
//

import Foundation
import UIKit

// ======== Coordinator ======== //

//protocol SearchCoordinatorDelegate: class {
//    func coordinator(_ coordinator: Coordinator, finishedWithSuccess success: Bool)
//}

// PRESENTER -> COORDINATOR
protocol SearchCoordinatorInput: class {
    func showDetailsOf(id: Int, type: Item.ContentType)
}

// ======== Interactor ======== //

// PRESENTER -> INTERACTOR
protocol SearchInteractorInput {
    func perform(_ request: Search.Request.SearchMovies)
    func perform(_ request: Search.Request.SearchTVShows)
    
    func cancel(_ request: Search.Cancel.Requests)
}

// INTERACTOR -> PRESENTER (indirect)
protocol SearchInteractorOutput: class {
    func present(_ response: Search.Response.MoviesFound)
    func present(_ response: Search.Response.TVShowsFound)
    func present(_ response: Search.Response.Error)
}

// ======== Presenter ======== //

// VIEW -> PRESENTER
protocol SearchPresenterInput {
    
    // MARK: - Properties -
    var numberOfMovies: Int { get }
    var numberOfTVShows: Int { get }
    
    // MARK: - Methods -
    func viewCreated()
    func viewWillDisappear()
    func search(with query: String)
    func configure(item: ItemListCellProtocol, at indexPath: IndexPath)
    func configure(item: SearchHeaderViewProtocol, at indexPath: IndexPath)
    func didEndDisplaying(item: ItemListCellProtocol, at indexPath: IndexPath)
    func displayEmptyState()
    func showDetails(at indexPath: IndexPath)
}

// PRESENTER -> VIEW
protocol SearchPresenterOutput: class {
    func display(_ displayModel: Search.DisplayData.Items)
    func display(_ displayModel: Search.DisplayData.Error)
}
