import UIKit

class InfoView: UIView {
    // Buttons
    var buttonFitness: UIButton!
    var buttonFood: UIButton!
    var buttonAcademy: UIButton!
    
    private var contentWrapper: UIScrollView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setupContentWrapper()
        setupButtonFitness()
        setupButtonFood()
        setupButtonAcademy()
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
        buttonFitness = createButton(title: "Fitness", color: .systemBlue)
        contentWrapper.addSubview(buttonFitness)
    }
    
    // Setup Food button
    private func setupButtonFood() {
        buttonFood = createButton(title: "Food", color: .systemGreen)
        contentWrapper.addSubview(buttonFood)
    }
    
    // Setup Academy button
    private func setupButtonAcademy() {
        buttonAcademy = createButton(title: "Academy", color: .systemOrange)
        contentWrapper.addSubview(buttonAcademy)
    }
    
    // Helper method to create buttons
    private func createButton(title: String, color: UIColor) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.backgroundColor = color
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
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
            buttonFitness.heightAnchor.constraint(equalToConstant: 50),
            
            // Food button constraints
            buttonFood.topAnchor.constraint(equalTo: buttonFitness.bottomAnchor, constant: 16),
            buttonFood.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            buttonFood.widthAnchor.constraint(equalTo: contentWrapper.widthAnchor, multiplier: 0.8),
            buttonFood.heightAnchor.constraint(equalToConstant: 50),
            
            // Academy button constraints
            buttonAcademy.topAnchor.constraint(equalTo: buttonFood.bottomAnchor, constant: 16),
            buttonAcademy.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            buttonAcademy.widthAnchor.constraint(equalTo: contentWrapper.widthAnchor, multiplier: 0.8),
            buttonAcademy.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
