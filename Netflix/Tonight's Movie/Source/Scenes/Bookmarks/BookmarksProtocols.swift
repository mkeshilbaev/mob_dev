//
//  BookmarksProtocols.swift
//  Tonight's Movie
//
//  Created by Madi Keshilbayev on 13.05.2022.
//

import Foundation
import UIKit

// ======== Coordinator ======== //

//protocol BookmarksCoordinatorDelegate: class {
//    func coordinator(_ coordinator: Coordinator, finishedWithSuccess success: Bool)
//}

// PRESENTER -> COORDINATOR
protocol BookmarksCoordinatorInput: class {
    func showDetailsOf(id: Int, type: Item.ContentType)
}

// ======== Interactor ======== //

// PRESENTER -> INTERACTOR
protocol BookmarksInteractorInput {
    func perform(_ request: Bookmarks.Request.FetchSavedItems)
    func perform(_ request: Bookmarks.Request.FetchRecommendationsMovies)
    func perform(_ request: Bookmarks.Request.FetchRecommendationsTVShows)
    
    func cancel(_ request: Bookmarks.Cancel.Requests)
}

// INTERACTOR -> PRESENTER (indirect)
protocol BookmarksInteractorOutput: class {
    func present(_ response: Bookmarks.Response.SavedItemsFetched)
    func present(_ response: Bookmarks.Response.RecommendationsMoviesFetched)
    func present(_ response: Bookmarks.Response.RecommendationsTVShowsFetched)
    
    func present(_ response: Bookmarks.Response.Error)
}

// ======== Presenter ======== //

// VIEW -> PRESENTER
protocol BookmarksPresenterInput {
    
    // MARK: - Properties -
    var numberOfSavedItems: Int { get }
    var numberOfRecommendedMovies: Int { get }
    var numberOfRecommendedTVShows: Int { get }
    
    // MARK: - Methods -
    func viewCreated()
    func viewWillAppear()
    func viewWillDisappear()
    func configure(item: ItemListCellProtocol, at indexPath: IndexPath)
    func configure(item: SearchHeaderViewProtocol, at indexPath: IndexPath)
    func didEndDisplaying(item: ItemListCellProtocol, at indexPath: IndexPath)
    func showDetails(at indexPath: IndexPath)
}

// PRESENTER -> VIEW
protocol BookmarksPresenterOutput: class {
    func display(_ displayModel: Bookmarks.DisplayData.Items)
    func display(_ displayModel: Bookmarks.DisplayData.Error)
}
