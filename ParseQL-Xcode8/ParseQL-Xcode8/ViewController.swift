//
//  ViewController.swift
//  ParseQL
//
//  Created by Pablo Guardiola on 28/06/16.
//  Copyright © 2016 Pablo Guardiola. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: CREATE
        let saveTestObject = PQL(tableName: "TestTable")
        
        saveTestObject.fields["Foo"] = "Bar"
        
        saveTestObject.save()
        // ------------
        
        
        // MARK: UPDATE
        let updateTestObject = PQL(tableName: "TestTable")
        
        updateTestObject.whereKey(key: "Foo", equalTo: "Bar")
        
        updateTestObject.setKey(key: "Foo", value: "Baaar")
        
        updateTestObject.update()
        // ------------
        
        
        // MARK: DELETE
        let deleteTestObject = PQL(tableName: "TestTable")
        
        deleteTestObject.whereKey(key: "Foo", equalTo: "Baaar")
        
        deleteTestObject.delete()
        // ------------
        
        
        // MARK: CREATE WITH BLOCK
        let saveBlockTestObject = PQL(tableName: "TestTable")
        
        saveBlockTestObject.fields["Foo"] = "Bar"
        
        saveBlockTestObject.saveWithBlock {(result: String) in
            //Save success!!
            print(result) //"OK" by now...
        }
        // ------------
        
        
        // MARK: UPDATE WITH BLOCK
        let updateBlockTestObject = PQL(tableName: "TestTable")
        
        updateBlockTestObject.whereKey(key: "Foo", equalTo: "Bar")
        
        updateBlockTestObject.setKey(key: "Foo", value: "Baaar")
        
        updateBlockTestObject.updateWithBlock {(affectedRows: Int) in
            //Update success
            print(affectedRows) //"1"
        }
        // ------------
        
        
        // MARK: DELETE WITH BLOCK
        let deleteBlockTestObject = PQL(tableName: "TestTable")
        
        deleteBlockTestObject.whereKey(key: "Foo", equalTo: "Baaar")
        
        deleteBlockTestObject.deleteWithBlock {(numOfAffectedRows: Int) in
            //Delete success!!
            print(numOfAffectedRows) // "1"
        }
        // ------------
        
        // MARK: GET
        let getBlockTestObject = PQL(tableName: "TestTable")
        
        getBlockTestObject.orderByAsc = "id"
        //getBlockTestObject.orderByDesc = "id"
        
        getBlockTestObject.whereKey(key: "Foo", equalTo: "Bar")
        
        getBlockTestObject.limit = 100
        
        getBlockTestObject.skip = 0
        
        getBlockTestObject.get {(results: [[String: AnyObject]]) in
            //Here come the data!!
            for row in results {
                print(row["Foo"]!) //"Bar"
            }
        }
        // ------------
    }
}

