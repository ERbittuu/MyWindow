//
//  ViewController.swift
//  Shopper
//
//  Created by Utsav Patel on 2/16/19.
//  Copyright © 2019 erbittuu. All rights reserved.
//

import Cocoa

class TabsController: NSViewController {
    
    @IBOutlet private weak var tableView: NSTableView!
    
    let firstRow = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }
}

extension TabsController : NSTableViewDelegate {

    func tableView(_ tableView: NSTableView, shouldSelectRow row: Int) -> Bool {
        return row != firstRow
    }
}

extension TabsController : NSTableViewDataSource {
    func numberOfRows(in tableView: NSTableView) -> Int {
        return Tab.list.count
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        if row != firstRow,
            let tableRowView = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier("TableRowView") , owner: nil) as? TableRowView {
            tableRowView.tab = Tab.list[row]
           return tableRowView
        }
        return nil
    }
    
    func tableView(_ tableView: NSTableView, rowViewForRow row: Int) -> NSTableRowView? {
        return TableRowView()
    }
    
    func tableViewSelectionDidChange(_ notification: Notification) {
        if tableView.selectedRow > firstRow {
            AppRouter.shared.select(row: tableView.selectedRow)
        }
    }
    
    func tableView(_ tableView: NSTableView, heightOfRow row: Int) -> CGFloat {
        return 40
    }
}

