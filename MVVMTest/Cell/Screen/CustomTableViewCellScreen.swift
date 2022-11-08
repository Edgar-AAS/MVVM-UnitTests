import UIKit

class CustomTableViewCellScreen: UIView {
    lazy var userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = imageView.frame.height / 2
        return imageView
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var ageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var professionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var salaryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var heartButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CustomTableViewCellScreen: CodeView {
    func buildHierarchy() {
        addSubview(userImageView)
        addSubview(nameLabel)
        addSubview(ageLabel)
        addSubview(professionLabel)
        addSubview(salaryLabel)
        addSubview(heartButton)
    }
    
    func setupConstrains() {
        NSLayoutConstraint.activate([
            userImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 18),
            userImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            userImageView.heightAnchor.constraint(equalToConstant: 128),
            userImageView.widthAnchor.constraint(equalToConstant: 128),
            
            nameLabel.topAnchor.constraint(equalTo: userImageView.topAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: 12),
            nameLabel.trailingAnchor.constraint(equalTo: heartButton.leadingAnchor, constant: 5),
            
            ageLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            ageLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            ageLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            
            professionLabel.topAnchor.constraint(equalTo: ageLabel.bottomAnchor, constant: 10),
            professionLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            professionLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            
            salaryLabel.topAnchor.constraint(equalTo: professionLabel.bottomAnchor, constant: 10),
            salaryLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            salaryLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            
            heartButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 18),
            heartButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12),
            heartButton.heightAnchor.constraint(equalToConstant: 22),
            heartButton.widthAnchor.constraint(equalToConstant: 22)
        ])
    }
}

