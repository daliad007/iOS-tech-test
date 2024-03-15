//
//  OccasionsViewController.swift
//  B&W
//
//  Created by Dalia on 15.03.2024.
//  Copyright © 2024 Artemis Simple Solutions Ltd. All rights reserved.
//

import UIKit

class OccasionsViewController: UIViewController, StoryboardInstantiable {

    static func create() -> OccasionsViewController {
        let view = OccasionsViewController.instantiateViewController()
        return view

    }
}
