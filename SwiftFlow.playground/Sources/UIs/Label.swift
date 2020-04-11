import UIKit

public class Label: UILabel {
  public init(_ text: String) {
    super.init(frame: .zero)
    self.text = text
    self.textColor = .black
    self.backgroundColor = .lightGray
    self.numberOfLines = 0
    self.textAlignment = .center
    self.font = .systemFont(ofSize: 18)
    self.translatesAutoresizingMaskIntoConstraints = false
  }

  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }

  public override var description: String {
    return "[Label frame = \(frame) \"\(text)\"]"
  }
}
