import UIKit

public enum BoxShape {
  case rect
  case pill
  case diamond
}

public enum Direction {
  case up
  case left
  case down
  case right
}

public struct EdgeOffsets {
  public let top: CGFloat
  public let left: CGFloat
  public let bottom: CGFloat
  public let right: CGFloat

  public init(top: CGFloat, left: CGFloat, bottom: CGFloat, right: CGFloat) {
    self.top = top
    self.left = left
    self.bottom = bottom
    self.right = right
  }

  public init(allSides value: CGFloat) {
    self.top = value
    self.left = value
    self.bottom = value
    self.right = value
  }

  public static func offset(from: EdgeOffsets, to: EdgeOffsets, direction: Direction) -> CGFloat {
    switch direction {
    case .up: return from.top + to.bottom
    case .left: return from.left + to.right
    case .down: return from.bottom + to.top
    case .right: return from.right + to.left
    }
  }
}

public struct BoxConfig {
  public var backgroundColor: UIColor = .clear
  public var borderColor: UIColor = .black
  public var edgeOffsets = EdgeOffsets(allSides: 20)

  public init() {}
}

public struct ArrowConfig {
  public var tailWidth: CGFloat = 2
  public var headWidth: CGFloat = 7
  public var headLength: CGFloat = 7

  public init() {}
}
