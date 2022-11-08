import Foundation

protocol CodeView {
    func buildHierarchy()
    func setupConstrains()
    func setupAdditionaConfiguration()
    func setupView()
}

extension CodeView {
    func setupView() {
        buildHierarchy()
        setupConstrains()
        setupAdditionaConfiguration()
    }
    
    func setupAdditionaConfiguration() {}
}

