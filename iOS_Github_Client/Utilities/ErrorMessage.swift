//
//  ErrorMessage.swift
//  iOS_Github_Client
//
//  Created by Roger Navarro on 4/6/21.
//

import Foundation

enum ErrorMessage: String {
  case invalidUsername = "This username created an invalid request. Please try again."
  case unabledRequest = "Unable to complete your request, please check your internet connection."
  case invalidResponse = "Invalid response from the server, please try again."
  case invalidData = "The data received from the server was invalid. Please try again."
  
}
