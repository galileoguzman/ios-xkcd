//
//  ReusableView+Ext.swift
//  xkcd
//
//  Created by Galileo Guzman on 18/03/22.
//

import Foundation

extension ReusableView {

    static var reuseIdentifier: String {
        return String(describing: self)
    }

}
