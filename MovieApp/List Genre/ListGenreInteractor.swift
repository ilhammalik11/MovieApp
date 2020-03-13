//
//  ListGenreInteractor.swift
//  MovieApp
//
//  Created by ILHAM on 12/03/20.
//  Copyright (c) 2020 ILHAM. All rights reserved.
//
///  Modify By:  * Ilham Malik Ibrahim
//              * ilhammalik19@gmail.com
//              * https://github.com/ilhammalik11

import UIKit

protocol ListGenreBusinessLogic
{
  func doModel(request: ListGenre.Model.Request)
}

protocol ListGenreDataStore
{
  //var name: String { get set }
    var data: ListGenre.Model.Fetch.Data! { get set }
}

class ListGenreInteractor: ListGenreBusinessLogic, ListGenreDataStore
{
  var presenter: ListGenrePresentationLogic?
  var worker: ListGenreWorker?
  var url: String = ""
  var data: ListGenre.Model.Fetch.Data!
  var viewController: ListGenreViewController?
  // MARK: Do Model
  
    func doModel(request: ListGenre.Model.Request)
  {
    worker = ListGenreWorker()
    worker?.interactor = self
    worker?.fetch(request: request) { result  in
        if result != nil {
            self.data = result!
            let response = ListGenre.Model.Response(data: result!)
            self.presenter?.presentModel(response: response)
        }
    }
  }
}
