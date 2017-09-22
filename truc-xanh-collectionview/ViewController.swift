//
//  ViewController.swift
//  truc-xanh-collectionview
//
//  Created by Pham An on 9/22/17.
//  Copyright © 2017 Pham An. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    @IBOutlet weak var colView: UICollectionView!
    var source = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]
    
    let itemperrow:CGFloat = 4
    let cellSpacing:CGFloat = 2
    let lineSpacing:CGFloat = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colView.delegate = self
        colView.dataSource = self
    }
    
}

extension ViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return source.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = colView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCollectionViewCell
        cell.img.image = UIImage(named: "default")
        cell.img.contentMode = .scaleAspectFit
        return cell
    }
    
}

extension ViewController: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberCellSpacing = itemperrow - 1
        let totalCellSpacingWidth = numberCellSpacing * cellSpacing
        let cellWidth = (colView.frame.width - totalCellSpacingWidth) / itemperrow
        let cellHeight:CGFloat = cellWidth
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return lineSpacing
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return cellSpacing
    }

}
extension ViewController{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = colView.cellForItem(at: indexPath) as! CustomCollectionViewCell
        cell.img.image = UIImage(named: String(indexPath.row))
    }
}
