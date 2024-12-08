import UIKit

class InfoView: UIView {
    // Buttons
    var buttonFitness: UIButton!
    var buttonFood: UIButton!
    var buttonAcademy: UIButton!
    var buttonResidential: UIButton!
    var buttonParking: UIButton!
    
    private var contentWrapper: UIScrollView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setupContentWrapper()
        setupButtonFitness()
        setupButtonFood()
        setupButtonAcademy()
        setupButtonResidential()
        setupButtonParking()
        initConstraints()
    }
    
    // Setup content wrapper (UIScrollView)
    private func setupContentWrapper() {
        contentWrapper = UIScrollView()
        contentWrapper.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(contentWrapper)
    }
    
    // Setup Fitness button
    private func setupButtonFitness() {
        buttonFitness = createButton(
            title: "Fitness",
            image: UIImage(systemName: "figure.walk.circle.fill"),
            color: .systemBlue
        )
        contentWrapper.addSubview(buttonFitness)
    }
    
    // Setup Food button
    private func setupButtonFood() {
        buttonFood = createButton(
            title: "Food",
            image: UIImage(systemName: "fork.knife.circle.fill"),
            color: .systemGreen
        )
        contentWrapper.addSubview(buttonFood)
    }
    
    // Setup Academy button
    private func setupButtonAcademy() {
        buttonAcademy = createButton(
            title: "Academy",
            image: UIImage(systemName: "book.circle.fill"),
            color: .systemOrange
        )
        contentWrapper.addSubview(buttonAcademy)
    }
    
    // Setup Residential button
    private func setupButtonResidential() {
        buttonResidential = createButton(
            title: "Residential",
            image: UIImage(systemName: "house.circle.fill"),
            color: .systemRed
        )
        contentWrapper.addSubview(buttonResidential)
    }
    
    // Setup Parking button
    private func setupButtonParking() {
        buttonParking = createButton(
            title: "Parking",
            image: UIImage(systemName: "car.circle.fill"),
            color: .systemPurple
        )
        contentWrapper.addSubview(buttonParking)
    }
    
    // Helper method to create buttons with image and text
    private func createButton(title: String, image: UIImage?, color: UIColor) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.setImage(image, for: .normal)
        button.tintColor = .white
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.backgroundColor = color
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        
        // Adjust image and text positioning
        button.contentVerticalAlignment = .center
        button.contentHorizontalAlignment = .center
        
        return button
    }
    
    // Initialize constraints
    private func initConstraints() {
        NSLayoutConstraint.activate([
            // Content wrapper constraints
            contentWrapper.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            contentWrapper.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            contentWrapper.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            contentWrapper.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            // Fitness button constraints
            buttonFitness.topAnchor.constraint(equalTo: contentWrapper.topAnchor, constant: 32),
            buttonFitness.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            buttonFitness.widthAnchor.constraint(equalTo: contentWrapper.widthAnchor, multiplier: 0.8),
            buttonFitness.heightAnchor.constraint(equalToConstant: 100),
            
            // Food button constraints
            buttonFood.topAnchor.constraint(equalTo: buttonFitness.bottomAnchor, constant: 16),
            buttonFood.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            buttonFood.widthAnchor.constraint(equalTo: contentWrapper.widthAnchor, multiplier: 0.8),
            buttonFood.heightAnchor.constraint(equalToConstant: 100),
            
            // Academy button constraints
            buttonAcademy.topAnchor.constraint(equalTo: buttonFood.bottomAnchor, constant: 16),
            buttonAcademy.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            buttonAcademy.widthAnchor.constraint(equalTo: contentWrapper.widthAnchor, multiplier: 0.8),
            buttonAcademy.heightAnchor.constraint(equalToConstant: 100),
            
            // Residential button constraints
            buttonResidential.topAnchor.constraint(equalTo: buttonAcademy.bottomAnchor, constant: 16),
            buttonResidential.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            buttonResidential.widthAnchor.constraint(equalTo: contentWrapper.widthAnchor, multiplier: 0.8),
            buttonResidential.heightAnchor.constraint(equalToConstant: 100),
            
            // Parking button constraints
            buttonParking.topAnchor.constraint(equalTo: buttonResidential.bottomAnchor, constant: 16),
            buttonParking.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            buttonParking.widthAnchor.constraint(equalTo: contentWrapper.widthAnchor, multiplier: 0.8),
            buttonParking.heightAnchor.constraint(equalToConstant: 100),
            
            // Content wrapper bottom to ensure scrollable content
            buttonParking.bottomAnchor.constraint(equalTo: contentWrapper.bottomAnchor, constant: -32)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
