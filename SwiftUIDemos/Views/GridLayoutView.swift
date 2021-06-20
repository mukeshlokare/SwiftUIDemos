//
//  GridLayoutView.swift
//  SwiftUIDemos
//
//  Created by mukesh on 26/05/20.
//  Copyright © 2020 neosoft. All rights reserved.
//

import SwiftUI

//struct GridLayoutView: View {
//    var body: some View {
//        GridStack(rows: 4, columns: 4) { row, col in
//            Image(systemName: "photo")
//            Text("R\(row) C\(col)")
//        }
//    }
//}

struct GridLayoutView: UIViewRepresentable {
    
    func makeUIView(context: Context) -> UICollectionView {
        let collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "myCell")
        let dataSource = UICollectionViewDiffableDataSource<MySection, MyModelObject>(collectionView: collectionView) { collectionView, indexPath, myModelObject in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath)
            cell.backgroundColor = .red
            // ...
            // Do whatever customization you want with your cell here!
            // ...
            return cell
        }
        populate(dataSource: dataSource)
        context.coordinator.dataSource = dataSource // <-- add this!
        return collectionView
    }

    func updateUIView(_ uiView: UICollectionView, context: Context) {
        // We'll leave this empty for now!
        let dataSource = context.coordinator.dataSource

    }

    func populate(dataSource: UICollectionViewDiffableDataSource<MySection, MyModelObject>) {
        var snapshot = NSDiffableDataSourceSnapshot<MySection, MyModelObject>()
        snapshot.appendSections([.main])
        snapshot.appendItems([MyModelObject(), MyModelObject(), MyModelObject()])
        dataSource.apply(snapshot)
    }
    
    func makeCoordinator() -> MyCoordinator {
        MyCoordinator()
    }
}

// This represents the different sections in our UICollectionView. When using UICollectionViewDiffableDataSource, the model must be Hashable (which enums already are)
enum MySection {
    case main
}

// This represents a model object that we would have in our collection. When using UICollectionViewDiffableDataSource, the model must be Hashable
class MyModelObject: Hashable {
    let id = UUID()

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    static func == (lhs: MyModelObject, rhs: MyModelObject) -> Bool {
        return lhs.id == rhs.id
    }
}


class MyCoordinator {
    var dataSource : UICollectionViewDiffableDataSource<MySection, MyModelObject>?
}

//
//
//struct GridStack<Content: View>: View {
//    let rows: Int
//    let columns: Int
//    let content: (Int, Int) -> Content
//
//    var body: some View {
//        VStack {
//            ForEach(0 ..< rows, id: \.self) { row in
//                HStack {
//                    ForEach(0 ..< self.columns, id: \.self) { column in
//                        self.content(row, column)
//                    }
//                }
//            }
//        }
//    }
//
//    init(rows: Int, columns: Int, @ViewBuilder content: @escaping (Int, Int) -> Content) {
//        self.rows = rows
//        self.columns = columns
//        self.content = content
//    }
//}

struct GridLayoutView_Previews: PreviewProvider {
    static var previews: some View {
        GridLayoutView()
    }
}
