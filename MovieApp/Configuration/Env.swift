//
//  Env.swift
//  MovieApp
//
//  Created by ILHAM on 12/03/20.
//  Copyright © 2020 ILHAM. All rights reserved.
//

import Foundation
import Alamofire

let IP = "https://api.themoviedb.org"+Version
let ClientID = "5dbd8230ea10ac91946a2a55b4ac4196"
let Version = "/3/"
let IPListGenre = IP+"genre/movie/list?api_key=\(ClientID)"
let IPListMovie = IP+"discover/movie?"
let IPListMoviewReview = IP+"movie"
let IPListVideoReview = IP+"videos"
let IPImage = "https://image.tmdb.org/t/p/w500/"
let IPMovieTrailer = "movie/495764/videos?api_key=5dbd8230ea10ac91946a2a55b4ac4196&language=en-US"
var headers: HTTPHeaders = [:]
let youtubeThumb = "https://img.youtube.com/vi/"
let youtubeLink = "https://www.youtube.com/watch?v="

