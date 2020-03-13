//
//  DetailMovieInteractor.swift
//  MovieApp
//
//  Created by ILHAM on 12/03/20.
//  Copyright (c) 2020 ILHAM. All rights reserved.
//
///  Modify By:  * Ilham Malik Ibrahim
//              * ilhammalik19@gmail.com
//              * https://github.com/ilhammalik11

import UIKit

protocol DetailMovieBusinessLogic
{
  func doModel(request: DetailMovie.Model.Request)
  func doModelVideo(request: DetailMovie.Model.Request)
}

protocol DetailMovieDataStore
{
  //var name: String { get set }
    var data: DetailMovie.Model.Fetch.Data! { get set }
}

class DetailMovieInteractor: DetailMovieBusinessLogic, DetailMovieDataStore
{
  var presenter: DetailMoviePresentationLogic?
  var worker: DetailMovieWorker?
  var url: String = ""
  var data: DetailMovie.Model.Fetch.Data!
  var viewController: DetailMovieViewController?
  // MARK: Do Model
  
    func doModel(request: DetailMovie.Model.Request)
  {
    worker = DetailMovieWorker()
    worker?.interactor = self
    worker?.fetch(request: request) { result  in
        if result != nil {
            self.data = result!
            let response = DetailMovie.Model.Response(data: result!)
            self.presenter?.presentModel(response: response)
        }
    }
  }
    
  func doModelVideo(request: DetailMovie.Model.Request)
 {
   worker = DetailMovieWorker()
   worker?.interactor = self
   worker?.fetchVideo(request: request) { result  in
       if result != nil {
           self.data = result!
           let response = DetailMovie.Model.Response(data: result!)
           self.presenter?.presentModel(response: response)
       }
   }
 }
}
