//
//  ListGenreRouter.swift
//  MovieApp
//
//  Created by ILHAM on 12/03/20.
//  Copyright (c) 2020 ILHAM. All rights reserved.
//
///  Modify By:  * Ilham Malik Ibrahim
//              * ilhammalik19@gmail.com
//              * https://github.com/ilhammalik11

import UIKit

@objc protocol ListGenreRoutingLogic
{
  //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol ListGenreDataPassing
{
  var dataStore: ListGenreDataStore? { get }
}

class ListGenreRouter: NSObject, ListGenreRoutingLogic, ListGenreDataPassing
{
  weak var viewController: ListGenreViewController?
  var dataStore: ListGenreDataStore?
  
  // MARK: Routing
  
  //func routeToSomewhere(segue: UIStoryboardSegue?)
  //{
  //  if let segue = segue {
  //    let destinationVC = segue.destination as! SomewhereViewController
  //    var destinationDS = destinationVC.router!.dataStore!
  //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
  //  } else {
  //    let storyboard = UIStoryboard(name: "Main", bundle: nil)
  //    let destinationVC = storyboard.instantiateViewController(withIdentifier: "SomewhereViewController") as! SomewhereViewController
  //    var destinationDS = destinationVC.router!.dataStore!
  //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
  //    navigateToSomewhere(source: viewController!, destination: destinationVC)
  //  }
  //}

  // MARK: Navigation
  
  //func navigateToSomewhere(source: ListGenreViewController, destination: SomewhereViewController)
  //{
  //  source.show(destination, sender: nil)
  //}
  
  // MARK: Passing data
  
  //func passDataToSomewhere(source: ListGenreDataStore, destination: inout SomewhereDataStore)
  //{
  //  destination.name = source.name
  //}
}
