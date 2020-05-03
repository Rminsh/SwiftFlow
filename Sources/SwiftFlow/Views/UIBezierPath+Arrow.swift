import UIKit

public extension CAShapeLayer {
  class func arrow(from: CGPoint, to: CGPoint, config: ArrowConfig) -> CAShapeLayer {
    let path = UIBezierPath.arrow(from: from, to: to, config: config)
    let layer = CAShapeLayer()
    layer.path = path.cgPath
    return layer
  }
}

public extension UIBezierPath {
  static func arrow(from start: CGPoint, to end: CGPoint, config: ArrowConfig) -> UIBezierPath {
    let length = hypot(end.x - start.x, end.y - start.y)
    let tailLength = length - config.headLength

    let points: [CGPoint] = [
      CGPoint(x: 0, y: config.tailWidth / 2),
      CGPoint(x: tailLength, y: config.tailWidth / 2),
      CGPoint(x: tailLength, y: config.headWidth / 2),
      CGPoint(x: length, y: 0),
      CGPoint(x: tailLength, y: -config.headWidth / 2),
      CGPoint(x: tailLength, y: -config.tailWidth / 2),
      CGPoint(x: 0, y: -config.tailWidth / 2)
    ]

    let cosine = (end.x - start.x) / length
    let sine = (end.y - start.y) / length
    let transform = CGAffineTransform(a: cosine, b: sine, c: -sine, d: cosine, tx: start.x, ty: start.y)

    let path = CGMutablePath()
    path.addLines(between: points, transform: transform)
    path.closeSubpath()

    return self.init(cgPath: path)
  }
}