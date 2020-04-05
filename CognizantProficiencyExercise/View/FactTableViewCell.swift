//
//  FactTableViewCell.swift
//  CognizantProficiencyExercise
//
//  Created by Nagaraj on 04/04/20.
//

import UIKit

final class FactTableViewCell: UITableViewCell {
  private var titleLabel: UILabel?
  private var descriptionLabel: UILabel?
  var factImageView: UIImageView?
  private let imageViewWidthHeight: CGFloat = 75
  private let paddingOfSubview: CGFloat = 10

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    titleLabel = getTitleLabel()
    descriptionLabel = getDescriptionLabel()
    factImageView = getFactImageView()

    guard let titleLabel = titleLabel,
      let descriptionLabel = descriptionLabel,
      let factImageView = factImageView else { return }

    addSubview(titleLabel)
    addSubview(descriptionLabel)
    addSubview(factImageView)

    factImageView.anchor(top: topAnchor, left: leftAnchor,
                         bottom: nil, right: nil,
                         paddingTop: paddingOfSubview, paddingLeft: paddingOfSubview,
                         paddingBottom: 0, paddingRight: 0,
                         width: imageViewWidthHeight, height: imageViewWidthHeight)
    titleLabel.anchor(top: topAnchor, left: factImageView.rightAnchor,
                      bottom: nil, right: rightAnchor,
                      paddingTop: paddingOfSubview, paddingLeft: paddingOfSubview,
                      paddingBottom: 0, paddingRight: paddingOfSubview,
                      width: 0, height: 0)
    descriptionLabel.anchor(top: titleLabel.bottomAnchor, left: factImageView.rightAnchor,
                            bottom: bottomAnchor, right: rightAnchor,
                            paddingTop: paddingOfSubview, paddingLeft: paddingOfSubview,
                            paddingBottom: paddingOfSubview, paddingRight: paddingOfSubview,
                            width: 0, height: 0)

  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func configureCell(_ factDataModel: FactDataModel) {
    titleLabel?.text = factDataModel.title ?? "No Title"
    descriptionLabel?.text = factDataModel.description ?? "No Description"
    factImageView?.image = UIImage(named: "placeholder")
  }

  private func getTitleLabel() -> UILabel {
    let lbl = UILabel()
    lbl.textColor = .black
    lbl.font = UIFont.boldSystemFont(ofSize: 16)
    lbl.textAlignment = .left
    return lbl
  }

  private func getDescriptionLabel() -> UILabel {
    let lbl = UILabel()
    lbl.textColor = .black
    lbl.font = UIFont.systemFont(ofSize: 16)
    lbl.textAlignment = .left
    lbl.numberOfLines = 0
    return lbl
  }

  private func getFactImageView() -> UIImageView {
    let imgView = UIImageView()
    imgView.layer.cornerRadius = 10
    imgView.clipsToBounds = true
    return imgView
  }
}
