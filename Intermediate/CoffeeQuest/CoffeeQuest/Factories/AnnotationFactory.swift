//
//  AnnotationFactory.swift
//  CoffeeQuest
//
//  Created by Weslie Chen on 2019/7/16.
//  Copyright © 2019 Jay Strawn. All rights reserved.
//

import UIKit
import MapKit
import YelpAPI

public class AnnotationFactory {
    
    public func createBusinessMapViewModel(for business: YLPBusiness) -> BusinessMapViewModel? {
        guard let yelpCoordinate = business.location.coordinate else { return nil }
        
        let coordinate = CLLocationCoordinate2D(latitude: yelpCoordinate.latitude, longitude: yelpCoordinate.longitude)
        let name = business.name
        let rating = business.rating
        let image: UIImage
        
        switch rating {
        case 0.0..<3.0: image = #imageLiteral(resourceName: "terrible")
        case 3.0..<3.5: image = #imageLiteral(resourceName: "bad")
        case 3.5..<4.0: image = #imageLiteral(resourceName: "meh")
        case 4.0..<4.75: image = #imageLiteral(resourceName: "good")
        case 4.75...5.0: image = #imageLiteral(resourceName: "great")
        default: image = #imageLiteral(resourceName: "bad")
        }
        
        return BusinessMapViewModel(coordinate: coordinate, name: name, rating: rating, image: image)
    }
}
