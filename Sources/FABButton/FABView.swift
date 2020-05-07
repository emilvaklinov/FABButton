import UIKit


class FABStackView: UIStackView {

    private var fabSecondaryButtons: [FABSecondary] = [FABSecondary]()
    private var secondaryButtons: [UIView] = [UIView]()
    private var secondaryViews: [UIView] = [UIView]()

    weak var delegate: FABSecondaryButtonDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureStackView()
    }
    
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configureStackView() {
        translatesAutoresizingMaskIntoConstraints = false
        distribution = .fill
        axis = .vertical
        alignment = .trailing
        spacing = 12
        clipsToBounds = true
    }
    
    
    private func configureSecondaryButtons() {
        for secondary in fabSecondaryButtons {
            let secondaryView = FABSecondaryButton(fabSecondary: secondary)
            secondaryView.delegate = self
            secondaryViews.append(secondaryView)
        }
        
        setSecondaryButtonsArray()
    }
    
    
    private func setSecondaryButtonsArray() {
        for view in secondaryViews {
            secondaryButtons.append(view)
        }
    }
}


// MARK: - Public methods
extension FABStackView {
    func addSecondaryButtonWith(image: UIImage, labelTitle: String, action: @escaping () -> ()) {
        let component: FABSecondary
        component.image = image
        component.title = labelTitle
        component.action = action
        fabSecondaryButtons.append(component)
    }
    
    
    func setFABButton() {
        configureSecondaryButtons()
    }
    
    
    func showButtons() {
        guard let view = secondaryButtons.last else {
            setSecondaryButtonsArray()
            return
        }
        
        secondaryButtons.removeLast()
        
        addArrangedSubview(view)
        
        NSLayoutConstraint.activate([
            view.leadingAnchor.constraint(equalTo: leadingAnchor),
            view.trailingAnchor.constraint(equalTo: trailingAnchor),
            view.heightAnchor.constraint(equalToConstant: 34)
        ])
        
        view.transform = CGAffineTransform.identity.scaledBy(x: 0.001, y: 0.001)
        UIView.animate(withDuration: 0.075, animations: {
            view.transform = CGAffineTransform.identity.scaledBy(x: 1.1, y: 1.1)
        }) { finished in
            UIView.animate(withDuration: 0.03, animations: {
                view.transform = CGAffineTransform.identity.scaledBy(x: 0.9, y: 0.9)
            }) { finished in
                UIView.animate(withDuration: 0.03, animations: {
                    view.transform = CGAffineTransform.identity
                }) { finished in
                    self.showButtons()
                }
            }
        }
    }
    
    
    func dismissButtons() {
        guard let view = secondaryButtons.last else {
            setSecondaryButtonsArray()
            return
        }
        
        secondaryButtons.removeLast()
        
        UIView.animate(withDuration: 0.075, animations: {
            view.transform = CGAffineTransform.identity.scaledBy(x: 0.001, y: 0.001)
        }) { finished in
            view.removeFromSuperview()
            self.dismissButtons()
        }
    }
}


extension FABStackView: FABSecondaryButtonDelegate {
    func secondaryActionForButton(_ action: @escaping () -> ()) {
        delegate?.secondaryActionForButton(action)
        dismissButtons()
    }
}
