//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by NADEZDA IVANOVA on 15.03.2022.
//

import UIKit


class PostTableViewCell: UITableViewCell {

    private var likesCount = 0
    weak var likesDelegate: ChangeLikesDelegate?
    struct PostUser: PostViewModelProtocol {
        
        var author: String  // никнейм автора публикации
        var description: String // текст публикации
        var image: String // имя картинки из каталога Assets.xcassets
        var likes: Int // количество лайков
        var views: Int // количество просмотров
    }
    
    private lazy var backView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.layer.maskedCorners = [
            .layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner
        ]
        return view
    }()
    
    private lazy var stackViewPost: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }()
    
    private lazy var stackViewLikesViews: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.numberOfLines = 2
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.setContentCompressionResistancePriority(UILayoutPriority(1000), for: .vertical)
        label.setContentHuggingPriority(UILayoutPriority(1), for: .vertical)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var pictureImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont(name: "System", size: 14)
        label.textColor = .systemGray
        label.setContentCompressionResistancePriority(UILayoutPriority(250), for: .vertical)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var likesLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.font = UIFont(name: "System", size: 16)
        label.textColor = .black
        label.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(likeLabelTapped))
        label.setContentCompressionResistancePriority(UILayoutPriority(750), for: .vertical)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.addGestureRecognizer(tap)
        return label
    }()
    
    
    
    @objc func likeLabelTapped() {
        self.likesDelegate?.likesChanged()
    }
    
    private lazy var viewsLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.font = UIFont(name: "System", size: 16)
        label.textColor = .black
        label.setContentCompressionResistancePriority(UILayoutPriority(750), for: .vertical)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.headerLabel.text = nil
        self.pictureImageView.image = nil
        self.descriptionLabel.text = nil
        self.likesLabel.text = nil
        self.viewsLabel.text = nil
    }
    
    
    
    private func setupView() {
        self.contentView.backgroundColor = .white
        self.contentView.addSubview(self.backView)
        self.backView.addSubview(self.stackViewPost)
        self.stackViewPost.addArrangedSubview(self.headerLabel)
        self.stackViewPost.addArrangedSubview(self.pictureImageView)
        self.stackViewPost.addArrangedSubview(self.descriptionLabel)
        self.stackViewPost.addArrangedSubview(self.stackViewLikesViews)
        self.stackViewLikesViews.addArrangedSubview(self.likesLabel)
        self.stackViewLikesViews.addArrangedSubview(self.viewsLabel)
        self.stackViewPost.backgroundColor = .white
        
        let backViewConstraints = self.backViewConstraints()
        let stackViewPostConstraints = self.stackViewPostConstraints()
        
        NSLayoutConstraint.activate(
            backViewConstraints +
            stackViewPostConstraints)
    }
    
    private func backViewConstraints() -> [NSLayoutConstraint] {
        return [
        self.backView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
        self.backView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
        self.backView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
        self.backView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)
        ]
    }
    
    private func stackViewPostConstraints() -> [NSLayoutConstraint] {
        return [
      self.stackViewPost.topAnchor.constraint(equalTo: self.backView.topAnchor),
      self.stackViewPost.leadingAnchor.constraint(equalTo: self.backView.leadingAnchor),
      self.stackViewPost.trailingAnchor.constraint(equalTo: self.backView.trailingAnchor),
      self.stackViewPost.bottomAnchor.constraint(equalTo: self.backView.bottomAnchor)
        ]
    }
}

extension PostTableViewCell: Setupable {
    
    func setup(with viewModel: PostViewModelProtocol) {
        guard let viewModel = viewModel as? PostUser else { return }
        
        self.headerLabel.text = viewModel.author
        self.descriptionLabel.text = viewModel.description
        self.pictureImageView.image = UIImage(named: viewModel.image)
        self.likesLabel.text = "Likes: \(String(viewModel.likes + likesCount))"
        self.viewsLabel.text = "Views: \(String(viewModel.views))"
        
    }
}



