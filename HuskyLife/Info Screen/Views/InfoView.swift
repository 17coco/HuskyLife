import UIKit

class InfoView: UIView {
    // Buttons
    var buttonFitness: UIButton!
    var buttonFood: UIButton!
    var buttonAcademy: UIButton!
    var buttonResidential: UIButton!
    var buttonParking: UIButton!
    
    var contentWrapper: UIScrollView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemBackground
        
        setupContentWrapper()
        setupButtonFitness()
        setupButtonFood()
        setupButtonAcademy()
        setupButtonResidential()
        setupButtonParking()
        initConstraints()
        animateButtonsOnAppear()
    }
    
    func setupContentWrapper() {
        contentWrapper = UIScrollView()
        contentWrapper.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.showsVerticalScrollIndicator = false
        contentWrapper.alwaysBounceVertical = true
        self.addSubview(contentWrapper)
    }

    func setupButtonFitness() {
        buttonFitness = createButton(
            title: "Fitness Center",
            image: UIImage(systemName: "figure.walk.circle.fill"),
            color: UIColor(red: 0.0, green: 0.478, blue: 1.0, alpha: 1.0)
        )
        contentWrapper.addSubview(buttonFitness)
    }

    func setupButtonFood() {
        buttonFood = createButton(
            title: "Dining Services",
            image: UIImage(systemName: "fork.knife.circle.fill"),
            color: UIColor(red: 0.156, green: 0.8, blue: 0.294, alpha: 1.0)
        )
        contentWrapper.addSubview(buttonFood)
    }

    func setupButtonAcademy() {
        buttonAcademy = createButton(
            title: "Academic Center",
            image: UIImage(systemName: "book.circle.fill"),
            color: UIColor(red: 1.0, green: 0.584, blue: 0.0, alpha: 1.0)
        )
        contentWrapper.addSubview(buttonAcademy)
    }

    func setupButtonResidential() {
        buttonResidential = createButton(
            title: "Housing",
            image: UIImage(systemName: "house.circle.fill"),
            color: UIColor(red: 1.0, green: 0.231, blue: 0.188, alpha: 1.0)
        )
        contentWrapper.addSubview(buttonResidential)
    }

    func setupButtonParking() {
        buttonParking = createButton(
            title: "Parking & Transit",
            image: UIImage(systemName: "car.circle.fill"),
            color: UIColor(red: 0.694, green: 0.329, blue: 0.863, alpha: 1.0)
        )
        contentWrapper.addSubview(buttonParking)
    }

    func createButton(title: String, image: UIImage?, color: UIColor) -> UIButton {
        let button = UIButton(type: .system)

        button.setTitle(title, for: .normal)
        button.setImage(image, for: .normal)
        button.tintColor = .white
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        button.backgroundColor = color
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 15
        button.translatesAutoresizingMaskIntoConstraints = false

        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 4)
        button.layer.shadowRadius = 8
        button.layer.shadowOpacity = 0.15
        button.contentVerticalAlignment = .center
        button.contentHorizontalAlignment = .center
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 12)
        button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        return button
    }

    @objc func buttonTapped(_ sender: UIButton) {
        UIView.animate(withDuration: 0.15, animations: {
            sender.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        }) { _ in
            UIView.animate(withDuration: 0.15) {
                sender.transform = .identity
            }
        }
    }
    func animateButtonsOnAppear() {
        let buttons = [buttonFitness, buttonFood, buttonAcademy, buttonResidential, buttonParking]
        buttons.enumerated().forEach { index, button in
            button?.alpha = 0
            button?.transform = CGAffineTransform(translationX: -30, y: 0)
            
            UIView.animate(
                withDuration: 0.6,
                delay: Double(index) * 0.1,
                usingSpringWithDamping: 0.8,
                initialSpringVelocity: 0.1,
                options: .curveEaseOut,
                animations: {
                    button?.alpha = 1
                    button?.transform = .identity
                }
            )
        }
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            contentWrapper.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            contentWrapper.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            contentWrapper.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            contentWrapper.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            buttonFitness.topAnchor.constraint(equalTo: contentWrapper.topAnchor, constant: 32),
            buttonFitness.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            buttonFitness.widthAnchor.constraint(equalTo: contentWrapper.widthAnchor, multiplier: 0.85),
            buttonFitness.heightAnchor.constraint(equalToConstant: 110),
            buttonFood.topAnchor.constraint(equalTo: buttonFitness.bottomAnchor, constant: 20),
            buttonFood.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            buttonFood.widthAnchor.constraint(equalTo: contentWrapper.widthAnchor, multiplier: 0.85),
            buttonFood.heightAnchor.constraint(equalToConstant: 110),
            buttonAcademy.topAnchor.constraint(equalTo: buttonFood.bottomAnchor, constant: 20),
            buttonAcademy.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            buttonAcademy.widthAnchor.constraint(equalTo: contentWrapper.widthAnchor, multiplier: 0.85),
            buttonAcademy.heightAnchor.constraint(equalToConstant: 110),
            buttonResidential.topAnchor.constraint(equalTo: buttonAcademy.bottomAnchor, constant: 20),
            buttonResidential.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            buttonResidential.widthAnchor.constraint(equalTo: contentWrapper.widthAnchor, multiplier: 0.85),
            buttonResidential.heightAnchor.constraint(equalToConstant: 110),
            buttonParking.topAnchor.constraint(equalTo: buttonResidential.bottomAnchor, constant: 20),
            buttonParking.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            buttonParking.widthAnchor.constraint(equalTo: contentWrapper.widthAnchor, multiplier: 0.85),
            buttonParking.heightAnchor.constraint(equalToConstant: 110),
            buttonParking.bottomAnchor.constraint(equalTo: contentWrapper.bottomAnchor, constant: -32)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
