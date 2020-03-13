//
//  ListMovieInteractor.swift
//  MovieApp
//
//  Created by ILHAM on 12/03/20.
//  Copyright (c) 2020 ILHAM. All rights reserved.
//
///  Modify By:  * Ilham Malik Ibrahim
//              * ilhammalik19@gmail.com
//              * https://github.com/ilhammalik11

import UIKit

protocol ListMovieBusinessLogic
{
  func doModel(request: ListMovie.Model.Request)
}

protocol ListMovieDataStore
{
  //var name: String { get set }
    var data: ListMovie.Model.Fetch.Data! { get set }
}

class ListMovieInteractor: ListMovieBusinessLogic, ListMovieDataStore
{
  var presenter: ListMoviePresentationLogic?
  var worker: ListMovieWorker?
  var url: String = ""
  var data: ListMovie.Model.Fetch.Data!
  var viewController: ListMovieViewController?
  // MARK: Do Model
  
    func doModel(request: ListMovie.Model.Request)
  {
    worker = ListMovieWorker()
    worker?.interactor = self
    worker?.fetch(request: request) { result  in
        if result != nil {
            self.data = result!
            let response = ListMovie.Model.Response(data: result!)
            self.presenter?.presentModel(response: response)
        }
    }
  }
}
