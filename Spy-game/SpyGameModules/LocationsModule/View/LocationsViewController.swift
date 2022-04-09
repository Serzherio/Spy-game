//
//  LocationsViewController.swift
//  Spy-game
//
//  Created by Сергей on 24.03.2022.
//

import Foundation
import UIKit

class LocationsViewController: UIViewController {

    // UI Elements
    let titleLabel = UILabel(textLabel: "Локации", font: .noteworthy50())
    let saveButton = UIButton(title: "Сохранить", titleColor: .black, backgroundColor: .white, font: .noteworthy30(), isShadow: true, cornerRadius: 40)
    let tableDescriptionLabel = UILabel(textLabel: "Зажмите локацию для просмотра", font: .noteworthy24())
    var collectionView: UICollectionView?
    // Variables
    var presenter: LocationPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "BackgroundImage")!)
        setupCollectionView()
        layoutDesign()
        titleLabel.text = "Локации: \(presenter!.gameSetting.selectedLocations.count)"
        saveButton.addTarget(self, action: #selector(saveButtonPressed), for: .touchUpInside)
    }
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 20, right: 10)
        let width = view.frame.width / 2
        layout.itemSize = CGSize(width: width - 40, height: width - 40)
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView?.register(MyCell.self, forCellWithReuseIdentifier: "myCell")
        collectionView?.backgroundColor = .clear
        collectionView?.delegate = self
        collectionView?.dataSource = self
    }
    
    private func layoutDesign() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        tableDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        collectionView?.translatesAutoresizingMaskIntoConstraints = false
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        view.addSubview(tableDescriptionLabel)
        view.addSubview(collectionView!)
        view.addSubview(saveButton)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tableDescriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            tableDescriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            collectionView!.topAnchor.constraint(equalTo: tableDescriptionLabel.bottomAnchor, constant: 30),
            collectionView!.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            collectionView!.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            collectionView!.bottomAnchor.constraint(equalTo: saveButton.topAnchor, constant: -30),
            saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            saveButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            saveButton.heightAnchor.constraint(equalToConstant: 80)
        ])
        
    }
    
    @objc private func saveButtonPressed() {
        presenter?.saveButtonPressed()
    }
    
}


extension LocationsViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.gameSetting.locations.keys.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let locationKeys = presenter?.gameSetting.locations.keys
        let locationTextArray = Array(locationKeys!)
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! MyCell
        myCell.backgroundColor = UIColor(red: 214/255, green: 148/255, blue: 148/255, alpha: 1)
        myCell.image.image = UIImage(named: locationTextArray[indexPath.row])
        myCell.title.text  = locationTextArray[indexPath.row]
        

        for i in presenter!.gameSetting.selectedLocations {
            if myCell.title.text == i {
                myCell.backgroundColor = .red
            }
        }
    return myCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let locationKeys = presenter?.gameSetting.locations.keys
        let locationTextArray = Array(locationKeys!)
        let selectedLocation = locationTextArray[indexPath.row]
        presenter?.selectLocation(location: selectedLocation)
        
    }
    
}

extension LocationsViewController: LocationViewProtocol {
    func updateUI() {
        collectionView?.reloadData()
        titleLabel.text = "Локации: \(presenter!.gameSetting.selectedLocations.count)"
    }

}
