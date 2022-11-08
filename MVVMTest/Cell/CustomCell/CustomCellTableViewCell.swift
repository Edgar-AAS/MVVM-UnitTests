import UIKit

protocol CustomCellTableViewCellDelegate: AnyObject {
    func didButtonHeartTapped(user: User)
}

final class CustomCellTableViewCell: UITableViewCell {
    private var viewModel: CustomCellViewModel?

    private weak var delegate: CustomCellTableViewCellDelegate?

    func delegate(delegate: CustomCellTableViewCellDelegate?) {
        self.delegate = delegate
    }

    private var screen = CustomTableViewCellScreen()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "PersonCell")
        selectionStyle = .none
        screen.translatesAutoresizingMaskIntoConstraints = false
        screen.heartButton.addTarget(self, action: #selector(tappedHeartButton), for: .touchUpInside)
        self.contentView.addSubview(screen)
        setupConstrains()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func tappedHeartButton() {
        guard let viewModel = viewModel else { return }

        if viewModel.getIsEnableHeart {
            screen.heartButton.tintColor = .red
            viewModel.exchangeEnableHeart(value: false)
        } else {
            screen.heartButton.tintColor = .blue
            viewModel.exchangeEnableHeart(value: true)
        }

        delegate?.didButtonHeartTapped(user: viewModel.getUser)
    }

    func setupConstrains() {
        NSLayoutConstraint.activate([
            screen.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            screen.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            screen.topAnchor.constraint(equalTo: self.topAnchor),
            screen.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }

    func setupCell(with user: User) {
        viewModel = CustomCellViewModel(data: user)
        
        guard let viewModel = viewModel else { return }

        screen.userImageView.image = UIImage(systemName: viewModel.getUserImage)
        screen.nameLabel.text = viewModel.getName
        screen.ageLabel.text = viewModel.getAge
        screen.salaryLabel.text = viewModel.getSalary
        screen.professionLabel.text = viewModel.getProfession

        if viewModel.getIsEnableHeart {
            screen.heartButton.tintColor = .blue
        } else {
            screen.heartButton.tintColor = .red
        }
    }
}
