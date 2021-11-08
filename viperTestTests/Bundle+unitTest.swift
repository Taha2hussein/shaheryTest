//
//  Bundle+unitTest.swift
//  viperTestTests
//
//  Created by A on 08/11/2021.
//

import Foundation
extension Bundle{
    public class var unitTest : Bundle{
        return Bundle(for: ListPresenterTests.self)
    }
}
