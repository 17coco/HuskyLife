import UIKit

class TrackerSessionTableViewCell: UITableViewCell {
    var wrapperCellView: UIView!
    var labelName: UILabel!
    var labelHours: UILabel!
    var labelGoal: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupWrapperCellView()
        setupLabelName()
        setupLabelHours()
        setupLabelGoal()
        
        initConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupWrapperCellView() {
        wrapperCellView = UITableViewCell()
        wrapperCellView.backgroundColor = .systemBackground
        wrapperCellView.layer.cornerRadius = 12.0
        wrapperCellView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
        wrapperCellView.layer.shadowOffset = CGSize(width: 0, height: 2)
        wrapperCellView.layer.shadowRadius = 8.0
        wrapperCellView.layer.shadowOpacity = 1.0
        wrapperCellView.layer.masksToBounds = false
        wrapperCellView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(wrapperCellView)
        wrapperCellView.layer.borderWidth = 1.0
        wrapperCellView.layer.borderColor = UIColor.systemGray6.cgColor
    }
    
    func setupLabelName() {
        labelName = UILabel()
        labelName.font = .systemFont(ofSize: 20, weight: .semibold)
        labelName.textColor = .label
        labelName.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelName)
    }
    
    func setupLabelHours() {
        labelHours = UILabel()
        labelHours.font = .systemFont(ofSize: 15, weight: .medium)
        labelHours.textColor = .systemBlue
        labelHours.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelHours)
    }
    
    func setupLabelGoal() {
        labelGoal = UILabel()
        labelGoal.font = .systemFont(ofSize: 14, weight: .regular)
        labelGoal.textColor = .secondaryLabel
        labelGoal.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelGoal)
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            // Wrapper view constraints with increased padding
            wrapperCellView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            wrapperCellView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            wrapperCellView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8),
            wrapperCellView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),

            labelName.topAnchor.constraint(equalTo: wrapperCellView.topAnchor, constant: 12),
            labelName.leadingAnchor.constraint(equalTo: wrapperCellView.leadingAnchor, constant: 16),
            labelName.trailingAnchor.constraint(equalTo: wrapperCellView.trailingAnchor, constant: -16),
            labelName.heightAnchor.constraint(equalToConstant: 24),
            labelHours.topAnchor.constraint(equalTo: labelName.bottomAnchor, constant: 4),
            labelHours.leadingAnchor.constraint(equalTo: labelName.leadingAnchor),
            labelHours.trailingAnchor.constraint(equalTo: labelName.trailingAnchor),
            labelHours.heightAnchor.constraint(equalToConstant: 18),

            labelGoal.topAnchor.constraint(equalTo: labelHours.bottomAnchor, constant: 4),
            labelGoal.leadingAnchor.constraint(equalTo: labelName.leadingAnchor),
            labelGoal.trailingAnchor.constraint(equalTo: labelName.trailingAnchor),
            labelGoal.heightAnchor.constraint(equalToConstant: 18),
            labelGoal.bottomAnchor.constraint(equalTo: wrapperCellView.bottomAnchor, constant: -12),

            wrapperCellView.heightAnchor.constraint(greaterThanOrEqualToConstant: 90)
        ])
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
