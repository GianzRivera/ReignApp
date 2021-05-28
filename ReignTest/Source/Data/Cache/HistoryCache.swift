//
//  HistoryCache.swift
//  ReignTest
//
//  Created by Gianz Rivera on 25/05/21.
//

import UIKit
import CoreData

class HistoryCache {
    
    func saveHistorys(histories: [History]) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        clearHistories()
        let managedContext = appDelegate.persistentContainer.viewContext
        let categoryEntity = NSEntityDescription.entity(forEntityName: "CDHistory", in: managedContext)!
       
        let historyMapper = HistoryMapper()
        histories.forEach { history in
            let cdHistory = CDHistory(entity: categoryEntity, insertInto: managedContext)
            historyMapper.toCoreData(history: history, intoCoreDataObject: cdHistory)
        }
        do {
            try managedContext.save()
            print("Success")
        } catch {
            print("Error saving: \(error)")
        }
        
    }
    
    func getHistories() -> [History]? {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let managedContext = appDelegate?.persistentContainer.viewContext
        
        let fetchRequest =
          NSFetchRequest<NSManagedObject>(entityName: "CDHistory")

        do {
            let cdHistories = try managedContext!.fetch(fetchRequest) as? [CDHistory]
            let historyMapper = HistoryMapper()
            return cdHistories?.map { historyMapper.fromCoreData(cdHistory: $0) }
        } catch let error as NSError {
          print("Could not fetch. \(error), \(error.userInfo)")
            return nil
        }
    }
    
    func clearHistories() {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {
            return
        }
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CDHistory")
        fetchRequest.includesPropertyValues = false
        do {
            let items = try managedContext.fetch(fetchRequest)
            for item in items { managedContext.delete(item) }
            try managedContext.save()
        } catch {
        }
    }
}
