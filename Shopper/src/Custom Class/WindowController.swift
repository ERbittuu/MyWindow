//
//  WindowController.swift
//  Shopper
//
//  Created by Utsav Patel on 2/17/19.
//  Copyright © 2019 erbittuu. All rights reserved.
//

import Cocoa

class WindowController: NSWindowController {
    
  override func windowDidLoad() {
    super.windowDidLoad()
    
    let customToolbar = NSToolbar()
    customToolbar.showsBaselineSeparator = false
    window?.styleMask.insert(.fullSizeContentView)
    window?.collectionBehavior = .fullScreenAuxiliary
    window?.titlebarAppearsTransparent = true
    window?.titleVisibility = .hidden
    window?.toolbar = customToolbar
    
    window?.isMovableByWindowBackground = true
    if let contentViewController = window?.contentViewController as? NSSplitViewController {
        AppRouter.shared.setContectView(contectView: contentViewController)
    }
  }
}
