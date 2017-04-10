//
//  AlertPresenterMock.swift
//  desafio-ios
//
//  Created by Cicero Camargo on 10/04/17.
//  Copyright © 2017 Stationfy. All rights reserved.
//

import Foundation
@testable import desafio_ios

class AlertPresenterMock: AlertPresenter {

    var didPresentAlert = false
    func presentDismissableAlert(title: String?, message: String?, dismissActionTitle: String?) {
        didPresentAlert = true
    }
}
