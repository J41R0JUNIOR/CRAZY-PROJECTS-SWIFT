//
//  CloudKitSetting.swift
//  PushNotification
//
//  Created by Jairo Júnior on 08/11/23.
//

import Foundation
import SwiftUI
import CloudKit

class CloudKitSetting: ObservableObject{
    @Published var permissionStatus: Bool = false
    @Published var isSignedToiCloud: Bool = false
    @Published var error: String = ""
    @Published var userName: String = ""
    @Published var email: String = ""
    
    init(){
        getiCloudStatus()
        requestPermission()
        fetchiCloudUserRecordID()
    }
    private func getiCloudStatus(){
        CKContainer.default().accountStatus { returnedStatus, returnedError in
            DispatchQueue.main.async {
                
                switch returnedStatus{
                case .available:
                    self.isSignedToiCloud = true
                    break
                case .noAccount:
                    self.error = CloudKitError.iCloudAccountNotFoud.rawValue
                    break
                case .couldNotDetermine:
                    self.error = CloudKitError.iCloudAccountNotDetermined.rawValue
                    break
                case .restricted:
                    self.error = CloudKitError.iCloudAccountRestricted.rawValue
                    break
                default:
                    self.error = CloudKitError.iCloudAccountUnknown.rawValue
                    break
                }
                if let error = returnedError {
                    // Trate o erro de maneira apropriada, talvez atribuindo à propriedade de erro ou registrando em algum lugar.
                    self.error = "Erro ao verificar o status do iCloud: \(error.localizedDescription)"
                }
            }
        }
    }
    
    enum CloudKitError: String, LocalizedError{
        case iCloudAccountNotFoud
        case iCloudAccountNotDetermined
        case iCloudAccountRestricted
        case iCloudAccountUnknown
    }
    
    func requestPermission(){
        CKContainer.default().requestApplicationPermission([.userDiscoverability]) {[weak self] returnedStatus, returnedError in
            DispatchQueue.main.async {
                print("Permission request returned status:", returnedStatus.rawValue)
                if returnedStatus == .granted {
                    print("Permission granted!")
                    self?.permissionStatus = true
                }
                else {
                    print("Permission not granted. \n error \(String(describing: returnedError))")
                }
                if let error = returnedError {
                    // Trate o erro de maneira apropriada, talvez atribuindo à propriedade de erro ou registrando em algum lugar.
                    print("Erro ao solicitar permissão: \(error.localizedDescription)")
                }
            }
        }
    }

    func fetchiCloudUserRecordID(){
        CKContainer.default().fetchUserRecordID {[weak self] returnedID, returnedError in
            if let id = returnedID{
                self?.discoveriCloudUser(id: id)
            }
        }
    }
    
    func discoveriCloudUser(id: CKRecord.ID){
        CKContainer.default().discoverUserIdentity(withUserRecordID: id) {[weak self] returnedIdentity, returnedError in
            DispatchQueue.main.async {
                if let name = returnedIdentity?.nameComponents?.givenName{
                    self?.userName = name
                }
            }
        }
    }
}


enum CloudKitError: String, Error{
    case iCloudAccountNotFound
    case iCloudAccountNotDetermined
    case iCloudAccountRestricted
    case iCloudAccountUnknown
    case nameNotFound
}
