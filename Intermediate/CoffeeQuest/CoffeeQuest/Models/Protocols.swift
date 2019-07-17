//
//  Protocols.swift
//  CoffeeQuest
//
//  Created by Weslie Chen on 2019/7/17.
//  Copyright © 2019 Jay Strawn. All rights reserved.
//

import Foundation
import MapKit
import YelpAPI

protocol SearchResultsProtocol {
    func adaptSearchResultFromYLP() -> SearchResults
}

protocol BusinessProtocol {
    func adaptBusinessFromYLP() -> Business
}

public struct SearchResults {
    var businesses: [Business]
    var total: UInt
}

public struct Business {
    var name: String
    var rating: Double
    var location: CLLocationCoordinate2D
}

extension YLPLocation {
    func getCoordinateFromYLP() -> CLLocationCoordinate2D {
        let coordinate = CLLocationCoordinate2D(latitude: self.coordinate!.latitude, longitude: self.coordinate!.longitude)
        return coordinate
    }
}

extension YLPBusiness: BusinessProtocol {
    func adaptBusinessFromYLP() -> Business {
        return Business(name: self.name, rating: self.rating, location: self.location.getCoordinateFromYLP()
        )
    }
}

extension YLPSearch: SearchResultsProtocol {
    func adaptSearchResultFromYLP() -> SearchResults {
        let businesses = self.businesses.map { (business: YLPBusiness) in
            business.adaptBusinessFromYLP()
        }
        
        return SearchResults(businesses: businesses, total: self.total)
    }
}
