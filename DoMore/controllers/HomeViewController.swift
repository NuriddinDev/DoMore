//
//  HomeViewController.swift
//  DoMore
//
//  Created by Nuriddin Musojonov on 10/08/21.
//

import UIKit

class HomeViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    @IBOutlet weak var collectionView: UICollectionView!
    var numberOfColomuns:CGFloat = 2
    var items: Array<Item> = Array()
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        
    }

    func initView(){
        navigationBar()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        self.collectionView.register(UINib(nibName: "ItemCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "myCell")
        
        if let flowLayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            let screenSize: CGRect = UIScreen.main.bounds
            let cellWidth = screenSize.width / numberOfColomuns - 15
            flowLayout.itemSize = CGSize(width: cellWidth, height: cellWidth)
        }
        
        items.append(Item(txt: "Model X", image: "im_teslax"))
        items.append(Item(txt: "Model S", image: "im_teslas"))
        items.append(Item(txt: "Model 3s", image: "im_tesla3s"))
        items.append(Item(txt: "Model 3", image: "im_tesla3"))
        items.append(Item(txt: "Model X", image: "im_teslax"))
        items.append(Item(txt: "Model S", image: "im_teslas"))
        items.append(Item(txt: "Model 3s", image: "im_tesla3s"))
        items.append(Item(txt: "Model 3", image: "im_tesla3"))
        
    }

    func navigationBar(){
        let scroll = UIImage(named: "ic_scroll")
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: scroll, style: .plain, target: self, action: #selector(scrollTapped))
        title = "Tesla models"
    }
    
    // MARK: - Navigation
    @objc func scrollTapped(){
    let nc = ScrollViewController(nibName: "ScrollViewController", bundle: nil)
        self.navigationController?.pushViewController(nc, animated: true)
    }
    
    //MARK: - CollectionView
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = items[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! ItemCollectionViewCell
        cell.img_cars.image = UIImage(named: item.image!)
        cell.lblModels.text = item.txt
        return cell
        
    }
    

}
