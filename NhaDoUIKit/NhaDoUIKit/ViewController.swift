//
//  ViewController.swift
//  NhaDoUIKit
//
//  Created by Nguyễn Hoàng Văn Nhã on 5/24/22.
//

import UIKit

class ViewController: UIViewController {
    enum Section {
        case main
    }

    var todoCollectionView: UICollectionView! = nil
    let newTodoButton = UIButton()
    var itemArray: [Item] = [Item]()

    override func viewDidLoad() {
        super.viewDidLoad()

        configureCollectionView()
        configureNewTodoButton()

        let stack = UIStackView(arrangedSubviews: [
            todoCollectionView,
            newTodoButton
        ])
        stack.axis = .vertical
        stack.alignment = .leading
        stack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stack)
        
        NSLayoutConstraint.activate([
            todoCollectionView.widthAnchor.constraint(equalTo: stack.widthAnchor),
            newTodoButton.heightAnchor.constraint(equalToConstant: 40),
            stack.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            stack.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            stack.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            stack.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor)
        ])
    }

    private func configureNewTodoButton() {
        newTodoButton.setImage(
            UIImage(systemName: "plus.circle.fill")?.withRenderingMode(.alwaysTemplate),
            for: .normal
        )
        newTodoButton.setTitle("New Task", for: .normal)
        newTodoButton.tintColor = .systemBlue
        newTodoButton.setTitleColor(.systemBlue, for: .normal)
        newTodoButton.addTarget(self, action: #selector(ViewController.onNewTodoButtonTapped), for: .touchUpInside)
    }

    private func configureCollectionView() {
        var configuration = UICollectionLayoutListConfiguration(appearance: .plain)
        let layout = UICollectionViewCompositionalLayout.list(using: configuration)
        todoCollectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        todoCollectionView.backgroundColor = .white
    }
    
    @objc func onNewTodoButtonTapped() {
        var textField: UITextField = UITextField()
        
        let alertController = UIAlertController(title: "Add todo", message: "", preferredStyle: .alert)
        
        let newItemAction = UIAlertAction(title: "Add", style: .default) { action in
            let newItem = Item()
        
            newItem.title = textField.text!
            newItem.done = false

            self.itemArray.append(newItem)
        }
    
        alertController.addTextField { alertTextField in
            textField.placeholder = "Todo"
            textField = alertTextField
        }
        alertController.addAction(newItemAction)
        present(alertController, animated: true, completion: nil)
    }
}
