//
//  OverViewInteractor.swift
//  MovieApp
//
//  Created by ILHAM on 13/03/20.
//  Copyright (c) 2020 ILHAM. All rights reserved.
//
///  Modify By:  * Ilham Malik Ibrahim
//              * ilhammalik19@gmail.com
//              * https://github.com/ilhammalik11

import UIKit

protocol OverViewBusinessLogic
{
  func doModel(request: OverView.Model.Request)
}

protocol OverViewDataStore
{
  //var name: String { get set }
    var data: OverView.Model.Fetch.Data! { get set }
}

class OverViewInteractor: OverViewBusinessLogic, OverViewDataStore
{
  var presenter: OverViewPresentationLogic?
  var worker: OverViewWorker?
  var url: String = ""
  var data: OverView.Model.Fetch.Data!
  var viewController: OverViewViewController?
  // MARK: Do Model
  
    func doModel(request: OverView.Model.Request)
  {
    worker = OverViewWorker()
    worker?.interactor = self
    worker?.fetch(url:url,request: request) { result  in
        if result != nil {
            self.data = result!
            let response = OverView.Model.Response(data: result!)
            self.presenter?.presentModel(response: response)
        }
    }
  }
}
