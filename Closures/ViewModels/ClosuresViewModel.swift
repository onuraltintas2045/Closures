//
//  ClosuresViewModel.swift
//  Closures
//
//  Created by Onur Altintas on 16.05.2025.
//

import Foundation


class ClosuresViewModel {
    
    var users: [User] = [] {
        //Neden didSet kullandık?
        //Çünkü apiden veri geldiğinde viewModeldeki users Set ediliyor
        //Set edilmesine closure atadık ve direkt olarak tableView' in reload edilmesini tetikledik.
        didSet {
            onUserUpdated?()
        }
    }
    
    //Basit projelerde callback için closure kullanmak daha mantıklı
    var onUserUpdated: (() -> Void)?
    
    //Closure kullanımına bir örnek, capturing özelliği önemli
    //Aşağıdaki kodda görüyoruz ki bir değişken gibi kullanılabildiğinden içerdeki değer kaldığı yerden arttırılabiliyor
    /*
     func makeCounter() -> () -> Int {
         var count = 0
         return {
             count += 1
             return count
         }
     }

     let counter = makeCounter()
     print(counter()) // 1
     print(counter()) // 2
     */
    
    //Animasyon örneği
    /*
     UIView.animate(withDuration: 1.0, animations: {
         // Bu kısım animasyondur
         self.view.alpha = 0.0
     }) { completed in
         // Animasyon bittiğinde çalışacak closure
         print("Animasyon tamamlandı.")
     }
     */
    
    //Filter, sorted, map gibi fonksiyonlarda kullanılıyor
    /*
     struct User {
         let name: String
         let age: Int
     }

     let users = [
         User(name: "Ali", age: 17),
         User(name: "Ayşe", age: 22),
         User(name: "Mehmet", age: 19)
     ]

     let adults = users.filter { $0.age >= 18 }

     print(adults.map { $0.name })
     
     let sortedUsers = users.sorted { $0.age < $1.age }

     for user in sortedUsers {
         print("\(user.name) - \(user.age)")
     }
     */
    
    func fetchUsers() {
        NetworkManager.shared.fetchData { [weak self] result in
            guard let self = self else { return }
            switch result {
                case .success(let users):
                    self.users = users
                case .failure(let error):
                    print("Error: \(error)")
            }
        }
        
    }
}
