//
//  MovieDetailLabel.swift
//  Movie_App
//
//  Created by Ani Dzamelashvili on 09.08.23.
//

import UIKit

class MovieDetailLabel: UIView {

    private let label: UILabel = {
        let label = UILabel()
        label.textColor = Constants.Colors.neutral_lighter_grey
        label.backgroundColor = Constants.Colors.neutral_darkest_grey
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 14)
//        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [label])
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setUpStackView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpStackView() {
        addSubview(stackView)
    }
    private func setContent(_ content: MovieLabelDetailModel) {
        
            label.text = content.title

    }
    
}


private extension NSAttributedString {
    static func attributedLabel(withIconNamed iconName: String, text: String) -> NSAttributedString {
        let iconAttachment = NSTextAttachment()
        iconAttachment.image = UIImage(named: iconName)
        let iconAttachmentString = NSAttributedString(attachment: iconAttachment)

        let textString = NSAttributedString(string: text)

        let finalString = NSMutableAttributedString()
        finalString.append(iconAttachmentString)
        finalString.append(NSAttributedString(string: " "))
        finalString.append(textString)

        return finalString
    }
}
