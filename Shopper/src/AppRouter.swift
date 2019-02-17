//
//  AppRouter.swift
//  Shopper
//
//  Created by Utsav Patel on 2/17/19.
//  Copyright © 2019 erbittuu. All rights reserved.
//

import Cocoa

enum Section: String {
    case hidden
    case home
    case customers
    case suppliers
    case products
    case settings
    
    static var list: [Section] {
        return [ .hidden, .home, .customers, .suppliers, .products, .settings]
    }
    
    static func createFromIndex(row: Int) -> Section {
        switch row {
        case 1:
            return .home
        case 2:
            return .customers
        case 3:
            return .suppliers
        case 4:
            return .products
        case 5:
            return .settings
        default:
            return .hidden
        }
    }
}

struct Tab {
    let title: String
    let icon: NSImage
    
    static var list: [Tab] {
        return Section.list.map({ Tab(title: $0.rawValue.capitalized, icon: NSImage(named: NSImage.Name($0.rawValue)) ?? NSImage()) })
    }
}


class AppRouter {
    static let shared = AppRouter()
    private init() { }
    
    private var tabsController: NSViewController?
    private var detailsController: NSTabViewController?
    
    func setContectView(contectView: NSSplitViewController) {
        if contectView.splitViewItems.count == 2 {
            self.tabsController = contectView.splitViewItems[0].viewController            
            if let detailsController = contectView.splitViewItems[1].viewController as? NSTabViewController {
                self.detailsController = detailsController
            }
        }
    }
    
    func select(row: Int) {
        let section = Section.createFromIndex(row: row)
        print("\(section.rawValue) Selected")
        self.detailsController?.selectedTabViewItemIndex = row - 1
    }
}
