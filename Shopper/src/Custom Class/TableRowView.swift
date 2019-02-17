//
//  TableRowView.swift
//  Shopper
//
//  Created by Utsav Patel on 2/17/19.
//  Copyright © 2019 erbittuu. All rights reserved.
//


import Cocoa

class TableRowView: NSTableRowView {
    
    @IBOutlet private weak var titleLabel: NSTextField!
    @IBOutlet private weak var iconImageView: NSImageView!
    
    var tab: Tab? {
        didSet{
            if let tab = tab {
                self.titleLabel.stringValue = tab.title
                self.iconImageView.image = tab.icon
            }
        }
    }
    
    override func draw(_ dirtyRect: NSRect) {
        self.isEmphasized = false
    }
}
