//
//  TableViewDelegateDataSource.swift
//  MVVMTestTests
//
//  Created by Leonardo Almeida on 11/11/22.
//

import UIKit
@testable import MVVMTest

class Stub: NSObject, UITableViewDataSource  {
    var data: [User]?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    }
}
