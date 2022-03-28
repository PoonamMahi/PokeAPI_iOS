//
//  HomeViewController.swift
//  PokiAPIGallery
//
//  Created by Cambrian on 2022-03-21.
//

import UIKit

class HomeViewController: UIViewController {
    
    /** **pokeImageArr** storing all images that we get from pokeapi.  */
    var pokeImageArr = [UIImage]()
    var selectedIndex = 3
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupCollectionView()
    }
    
    /** Setting up collection view UI */
    func setupCollectionView() {
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    /** Deleting pokeman image from list. */
    @objc func deleteButtonAction(_ sender: UIButton) {
        
        let index = sender.tag
        pokeImageArr.remove(at: index)
        collectionView.performBatchUpdates {
            collectionView.deleteItems(at: [IndexPath(row: index, section: 0)])
        } completion: { _ in
            self.collectionView.reloadData()
        }
    
    }


}

//MARK:- CollectionView delegate functions
extension HomeViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokeImageArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell : PokeImageCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokeImageCollectionViewCell", for: indexPath) as! PokeImageCollectionViewCell
        
        let index = indexPath.row
        cell.pokeimage.image = pokeImageArr[index]
        
        cell.deleteImageButton.addTarget(self, action: #selector(deleteButtonAction(_:)), for: .touchUpInside)
        cell.deleteImageButton.tag = index
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: UIScreen.main.bounds.width, height: 170)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        UIView.animate(withDuration: 0.5) {
            if let cell = collectionView.cellForItem(at: indexPath) as? PokeImageCollectionViewCell {
                cell.transform = .init(scaleX: 1.25, y: 1.25)
                cell.pokeimage.backgroundColor = .black
            }
        }
    }

     func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        UIView.animate(withDuration: 0.5) {
            if let cell = collectionView.cellForItem(at: indexPath) as? PokeImageCollectionViewCell {
                cell.transform = .identity
                cell.pokeimage.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
            }
        }
    }
    
    
    
}





