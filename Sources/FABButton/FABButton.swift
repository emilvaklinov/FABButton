import UIKit

 
public class FABView: UIStackView {
    
    private let stackView = UIStackView(frame: .zero)
    private var mainButton = UIButton(frame: .zero)
 
    public init(buttonImage: UIImage?) {
        super.init(frame: .zero)
        
        mainButton.setImage(buttonImage, for: .normal)
        mainButton.addTarget(self, action: #selector(mainButtonAction), for: .touchUpInside)
        configure()
    }
    
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        configureContainer()
        layoutUI()
    }
    
    
    private func configureContainer() {
        translatesAutoresizingMaskIntoConstraints = false
        distribution = .fill
        axis = .vertical
        alignment = .trailing
        spacing = 16
        clipsToBounds = true
//        stackView.delegate = self
    }
    
 
    @objc private func mainButtonAction() {
 
 
    }
    
    
    private func layoutUI() {
        addArrangedSubview(stackView)
        addArrangedSubview(mainButton)
 
        NSLayoutConstraint.activate([
            mainButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainButton.bottomAnchor.constraint(equalTo: bottomAnchor),
            mainButton.widthAnchor.constraint(equalToConstant: 50),
            mainButton.heightAnchor.constraint(equalToConstant: 50),
            
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
}

