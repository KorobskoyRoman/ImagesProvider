//
//  SearchViewController.swift
//  ImagesProvider
//
//  Created by Roman Korobskoy on 17.01.2022.
//

import UIKit
import Nuke

private let reuseIdentifier = "Cell"

class SearchViewController: UICollectionViewController {

    private let searchController = UISearchController(searchResultsController: nil)
    private let networkManager = NetworkManger()
    private var images: ImageModel?
    private var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupSearchBar()
        searchBar(searchController.searchBar, textDidChange: "apple")
    }
    
    private func setupSearchBar() {
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.placeholder = "Enter search query"
        searchController.searchBar.delegate = self
        searchController.searchBar.autocapitalizationType = .none
        searchController.hidesNavigationBarDuringPresentation = false
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowImage" {
            guard let indexPath = collectionView.indexPathsForSelectedItems?.first else { return }
            let image = images?.images[indexPath.item]
            let destVC = segue.destination as! DetailsViewController
            destVC.imageModel = image!
        }
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images?.images.count ?? 1
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ImagesCell
    
        let image = images?.images[indexPath.item]
        Nuke.loadImage(with: image, into: cell.searchImage)
    
        return cell
    }
}

//MARK: - UICollectionViewDelegateFlowLayout

extension SearchViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
}

//MARK: - UISearchBarDelegate

extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.timer?.invalidate()
        self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: false, block: { [self] _ in
            self.networkManager.fetchImages(searchText: searchText) { [weak self] searchResults in
                self?.images = searchResults
                DispatchQueue.main.async {
                    self?.collectionView.reloadData()
                }
            }
        })
    }
}
