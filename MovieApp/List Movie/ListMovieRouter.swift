//
//  ListMovieRouter.swift
//  MovieApp
//
//  Created by ILHAM on 12/03/20.
//  Copyright (c) 2020 ILHAM. All rights reserved.
//
///  Modify By:  * Ilham Malik Ibrahim
//              * ilhammalik19@gmail.com
//              * https://github.com/ilhammalik11

import UIKit

protocol ListMovieRoutingLogic
{
  func routeToDetail(data: ListMovie.Model.Fetch.Result)
}

protocol ListMovieDataPassing
{
  var dataStore: ListMovieDataStore? { get }
}

class ListMovieRouter: NSObject, ListMovieRoutingLogic, ListMovieDataPassing
{
  weak var viewController: ListMovieViewController?
  var dataStore: ListMovieDataStore?
  
  // MARK: Routing
  
  func routeToDetail(data: ListMovie.Model.Fetch.Result)
  {
   
      let storyboard = UIStoryboard(name: "Main", bundle: nil)
      let destinationVC = storyboard.instantiateViewController(withIdentifier: "DetailMovieViewController") as! DetailMovieViewController
          destinationVC.data = data
      navigateToDetail(source: viewController!, destination: destinationVC)
  }

  // MARK: Navigation
  
  func navigateToDetail(source: ListMovieViewController, destination: DetailMovieViewController)
  {
    source.present(destination, animated: false, completion: nil)
  }
  
  // MARK: Passing data
  
}
