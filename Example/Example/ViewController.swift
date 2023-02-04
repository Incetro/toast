//
//  ViewController.swift
//  Example
//
//  Created by incetro on 5/12/21.
//

import UIKit
import Toast
import Layout
import Lottie
import AloeStackView
import HapticFeedback

// MARK: - Examples

private enum Examples: String, CaseIterable {

    case success   = "Some action was successfully completed"
    case error     = "Some error has occured"
    case warning   = "An interesting warning has occured"
    case info      = "This is some short info"
    case animation = "Some animation as an image"

    case bottom    = "The toast which presents from the bottom"
    case top       = "The toast which presents from the top"

    case vertical  = "The toast is showed vertically and will be dismissed vertically"
    case left      = "The toast is showed from the left and will be dismissed from the left"
    case right     = "The toast is showed from the right and will be dismissed from the right"
    case combo     = "The toast is showed from the left and will be dismissed vertically"

    case custom1   = "The toast will show custom colors and font"
    case custom2   = "The toast will show right icon alignment"
    case custom3   = "The toast will show no icon and 87% screen size width"
}

// MARK: - ViewController

class ViewController: UIViewController {

    // MARK: - Properties

    private let hapticFeedback = HapticFeedback()
    private let stackView = AloeStackView()

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(white: 243.0 / 255.0, alpha: 1)
        view.addSubview(stackView.prepareForAutolayout())
        stackView
            .pinToSuperview(withSides: .left, .right)
            .bottom(to: view.bottom)
            .top(to: safeTop)
        stackView.separatorColor = .clear
        stackView.backgroundColor = .clear
        setupContent()
    }

    // MARK: - Private

    private func setupContent() {

        addSection(named: "Basic")
        addRow("Success", cornersType: .first) {
            self.hapticFeedback.generate(.success)
            Toast(Examples.success.rawValue, state: .success, source: self).show(.short)
        }
        addRow("Info", cornersType: .regular) {
            self.hapticFeedback.generate(.light)
            Toast(
                Examples.info.rawValue,
                state: .info,
                source: self
            ).show(.short)
        }
        addRow("Warning", cornersType: .regular) {
            self.hapticFeedback.generate(.medium)
            Toast(
                Examples.warning.rawValue,
                state: .warning,
                source: self
            ).show(.short)

        }
        addRow("Error", cornersType: .regular) {
            self.hapticFeedback.generate(.error)
            Toast(
                Examples.error.rawValue,
                state: .error,
                source: self
            ).show(.short)
        }
//        addRow("Animation", cornersType: .last) {
//            self.hapticFeedback.generate(.light)
//            let animationView = AnimationView()
//            animationView.prepareForAutolayout()
//            animationView.loopMode = .loop
//            animationView.animation = Animation.named("clock")
//            animationView.play()
//            Toast(
//                Examples.animation.rawValue,
//                state: .custom(
//                    .init(
//                        backgroundColor: .init(hexString: "#738290"),
//                        accessory: .custom(animationView)
//                    )
//                ),
//                source: self
//            ).show(.average)
//        }

        addSection(named: "Locations")
        addRow("Bottom", cornersType: .first) {
            self.hapticFeedback.generate(.light)
            Toast(
                Examples.bottom.rawValue,
                state: .success,
                source: self
            ).show(.short)
        }
        addRow("Top", cornersType: .last) {
            self.hapticFeedback.generate(.light)
            Toast(
                Examples.top.rawValue,
                location: .top,
                source: self
            ).show(.short)
        }

        addSection(named: "Directions")
        addRow("Vertical", cornersType: .first) {
            self.hapticFeedback.generate(.light)
            Toast(
                Examples.vertical.rawValue,
                source: self
            ).show(.short)
        }
        addRow("Left", cornersType: .regular) {
            self.hapticFeedback.generate(.light)
            Toast(
                Examples.left.rawValue,
                presentingDirection: .left,
                dismissingDirection: .left,
                source: self
            ).show(.short)
        }
        addRow("Right", cornersType: .regular) {
            self.hapticFeedback.generate(.light)
            Toast(
                Examples.right.rawValue,
                presentingDirection: .right,
                dismissingDirection: .right,
                source: self
            ).show(.short)
        }
        addRow("Combo", cornersType: .last) {
            self.hapticFeedback.generate(.light)
            Toast(
                Examples.combo.rawValue,
                presentingDirection: .left,
                dismissingDirection: .vertical,
                source: self
            ).show(.short)
        }

        addSection(named: "Custom")
        addRow("Color + font", cornersType: .first) {
            self.hapticFeedback.generate(.light)
            Toast(
                Examples.custom1.rawValue,
                state: .custom(
                    .init(
                        backgroundColor: .init(hexString: "#44AF69"),
                        textColor: .white,
                        tintColor: .black,
                        font: .systemFont(ofSize: 17, weight: .semibold),
                        accessory: .standard(Toast.Icon.success)
                    )
                ),
                source: self
            ).show(.short)
        }
        addRow("Right icon position", cornersType: .regular) {
            self.hapticFeedback.generate(.light)
            Toast(
                Examples.custom2.rawValue,
                state: .custom(
                    .init(
                        backgroundColor: .init(hexString: "#DBD5B5"),
                        textColor: .white,
                        tintColor: .black,
                        iconAlignment: .right
                    )
                ),
                source: self
            ).show(.short)
        }
        addRow("No icon + custom width", cornersType: .last) {
            self.hapticFeedback.generate(.light)
            Toast(
                Examples.custom3.rawValue,
                state: .custom(
                    .init(
                        backgroundColor: .black,
                        accessory: nil,
                        textAlignment: .center,
                        width: .screenPercentage(0.87)
                    )
                ),
                source: self
            ).show(.short)
        }
        
        addSection(named: "Toast View")
        addRow("Toast View top", cornersType: .first) {
            self.hapticFeedback.generate(.light)
            Toast(
                Examples.left.rawValue,
                location: .top,
                source: self
            )
            .showView()
        }
        
        addRow("Toast View bottom", cornersType: .last) {
            self.hapticFeedback.generate(.light)
            Toast(
                Examples.left.rawValue,
                location: .bottom,
                source: self
            ).showView()
        }
    }

    private func addSection(named name: String) {
        let sectionTitleLabel = UILabel()
        sectionTitleLabel.text = name.uppercased()
        sectionTitleLabel.font = UIFont(name: "Avenir-Book", size: 13)
        sectionTitleLabel.textColor = .lightGray
        stackView.addRow(sectionTitleLabel)
        stackView.setInset(forRow: sectionTitleLabel, inset: Constants.sectionInsets)
    }

    private func addRow(
        _ title: String,
        cornersType: UIView.SmoothCornerType,
        action: @escaping () -> ()
    ) {
        let inset: UIEdgeInsets
        switch cornersType {
        case .first:
            inset = UIEdgeInsets(top: 8, left: 13, bottom: 1, right: 13)
        case .last:
            inset = UIEdgeInsets(top: 1, left: 13, bottom: 8, right: 13)
        default:
            inset = UIEdgeInsets(top: 1, left: 13, bottom: 1, right: 13)
        }
        let row = ExampleStackViewCell(title: title)
        row.cornersType = cornersType
        stackView.addRow(row.prepareForAutolayout().height(52))
        stackView.setInset(forRow: row, inset: inset)
        stackView.setTapHandler(forRow: row) { _ in
            row.highlight()
            action()
        }
    }
}

// MARK: - ExampleStackViewCell

final class ExampleStackViewCell: UIView {

    // MARK: - Properties

    var isHighlighted: Bool = false {
        didSet {
            titleLabel.alpha = isHighlighted ? 0.38 : 1
        }
    }

    /// Main text label
    private let titleLabel = UILabel()

    /// Disclosure indicator view
    private let disclosureIndicatorImageView = UIImageView()

    /// Current corners type
    var cornersType: SmoothCornerType = .regular {
        didSet {
            roundCourners(cornersType, radius: Constants.cornerRadius)
        }
    }

    // MARK: - Initializers

    /// Default initializer
    /// - Parameters:
    ///   - title: main text
    init(title: String) {
        super.init(frame: .zero)
        titleLabel.textColor = .black
        titleLabel.text = title
        setupTitleLabel()
        setupDisclosureIndicator()
        backgroundColor = .white
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func highlight(timeInterval: TimeInterval = 0.25) {
        isHighlighted = true
        UIView.animate(
            withDuration: timeInterval,
            delay: 0.25,
            options: .curveLinear
        ) { self.isHighlighted = false }
    }

    func updateConers(_ cornerRadiusType: SmoothCornerType) {
        self.cornersType = cornerRadiusType
    }
}

// MARK: - Layout

extension ExampleStackViewCell {

    private func setupTitleLabel() {
        let inset = Constants.contentInsets
        addSubview(titleLabel.prepareForAutolayout())
        titleLabel
            .centerY(to: centerY)
            .left(to: left + inset.left)
        titleLabel.font = UIFont(name: "Avenir-Heavy", size: 15)
    }

    private func setupDisclosureIndicator() {
        let inset = Constants.contentInsets
        addSubview(disclosureIndicatorImageView.prepareForAutolayout())
        disclosureIndicatorImageView
            .centerY(to: centerY)
            .right(to: right - inset.left)
            .left(to: titleLabel.right - inset.left)
            .size(Constants.disclosureIndicatorSize)
    }
}

// MARK: - Constants

enum Constants {
    static let sectionInsets = UIEdgeInsets(top: 16, left: 24, bottom: 1, right: 16)
    static let contentInsets = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
    static let imageViewSize = CGSize(width: 24, height: 24)
    static let spacing: CGFloat = 8
    static let cornerRadius: CGFloat = 13
    static let disclosureIndicatorSize = CGSize(width: 7, height: 11)
}

// MARK: - UIView

extension UIView {

    enum SmoothCornerType {

        case first
        case last
        case left
        case right

        case topLeft
        case topRight
        case bottomLeft
        case bottomRight

        case full
        case regular

        /// UIKit corners
        public var corners: CACornerMask {
            switch self {
            case .topLeft:
                return .layerMinXMinYCorner
            case .topRight:
                return .layerMaxXMinYCorner
            case .bottomLeft:
                return .layerMinXMaxYCorner
            case .bottomRight:
                return .layerMaxXMaxYCorner
            case .full:
                return [
                    .layerMinXMinYCorner,
                    .layerMaxXMinYCorner,
                    .layerMinXMaxYCorner,
                    .layerMaxXMaxYCorner
                ]
            case .first:
                return [.layerMinXMinYCorner, .layerMaxXMinYCorner]
            case .last:
                return [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
            case .left:
                return [.layerMinXMinYCorner, .layerMinXMaxYCorner]
            case .right:
                return [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
            default:
                return []
            }
        }
    }

    func roundCourners(_ corners: SmoothCornerType = .full, radius: CGFloat) {
        layer.cornerRadius = radius
        layer.maskedCorners = corners.corners
        layer.masksToBounds = true
    }
}
